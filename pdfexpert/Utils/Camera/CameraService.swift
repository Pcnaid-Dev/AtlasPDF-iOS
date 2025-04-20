//
//  CameraService.swift
//  SwiftCamera
//
//  Created by Rolando Rodriguez on 10/15/20.
//

import Foundation
import Combine
import AVFoundation
import UIKit

//  MARK: Class Camera Service, handles setup of AVFoundation needed for a basic camera app.
public struct Photo: Identifiable, Equatable {
//    The ID of the captured photo
    public var id: String
//    Data representation of the captured photo
    public var originalData: Data
    
    public init(id: String = UUID().uuidString, originalData: Data) {
        self.id = id
        self.originalData = originalData
    }
}

public enum CameraError {
    case permissionDenied
    case cameraUnavailable
}

extension Photo {
    public var compressedData: Data? {
        ImageResizer(targetWidth: 800).resize(data: originalData)?.jpegData(compressionQuality: 0.5)
    }
    public var thumbnailData: Data? {
        ImageResizer(targetWidth: 100).resize(data: originalData)?.jpegData(compressionQuality: 0.5)
    }
    public var thumbnailImage: UIImage? {
        guard let data = thumbnailData else { return nil }
        return UIImage(data: data)
    }
    public var image: UIImage? {
        guard let data = compressedData else { return nil }
        return UIImage(data: data)
    }
}

public class CameraService {
    typealias PhotoCaptureSessionID = String
    
    //    MARK: Observed Properties UI must react to
    
    //    1.
    @Published public var flashMode: AVCaptureDevice.FlashMode = .off
    //    2.
    @Published public var error: CameraError? = nil
    //    3.
    @Published public var shouldShowSpinner = false
    //    4.
    @Published public var willCapturePhoto = false
    //    5.
    @Published public var isCameraButtonDisabled = true
    //    6.
    @Published public var isCameraUnavailable = true
    //    8.
    @Published public var photo: Photo?
    
    // MARK: Session Management Properties
    
    //    9
    public let session = AVCaptureSession()
    //    10
    var isSessionRunning = false
    //    12
    var isConfigured = false
    //    13
    var setupResult: SessionSetupResult = .success
    //    14
    // Communicate with the session and other session objects on this queue.
    private let sessionQueue = DispatchQueue(label: "session queue")
    
    @objc dynamic var videoDeviceInput: AVCaptureDeviceInput!
    
    // MARK: Device Configuration Properties
    private let videoDeviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInDualCamera, .builtInTrueDepthCamera], mediaType: .video, position: .unspecified)
    
    // MARK: Capturing Photos
    
    private let photoOutput = AVCapturePhotoOutput()
    
    private var inProgressPhotoCaptureDelegates = [Int64: PhotoCaptureProcessor]()
    
    // MARK: KVO and Notifications Properties
    
    private var keyValueObservations = [NSKeyValueObservation]()
    
    
    public func configure() {
        /*
         Setup the capture session.
         In general, it's not safe to mutate an AVCaptureSession or any of its
         inputs, outputs, or connections from multiple threads at the same time.
         
         Don't perform these tasks on the main queue because
         AVCaptureSession.startRunning() is a blocking call, which can
         take a long time. Dispatch session setup to the sessionQueue, so
         that the main queue isn't blocked, which keeps the UI responsive.
         */
        sessionQueue.async {
            self.configureSession()
        }
    }
    
    //        MARK: Checks for user's permisions
    public func checkForPermissions() {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            // The user has previously granted access to the camera.
            break
        case .notDetermined:
            /*
             The user has not yet been presented with the option to grant
             video access. Suspend the session queue to delay session
             setup until the access request has completed.
             */
            sessionQueue.suspend()
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
                if !granted {
                    self.setupResult = .notAuthorized
                }
                self.sessionQueue.resume()
            })
            
        default:
            // The user has previously denied access.
            setupResult = .notAuthorized
            
            DispatchQueue.main.async {
                self.error = .permissionDenied
                self.isCameraUnavailable = true
                self.isCameraButtonDisabled = true
            }
        }
    }
    
    //  MARK: Session Management
    
    // Call this on the session queue.
    /// - Tag: ConfigureSession
    private func configureSession() {
        if setupResult != .success {
            return
        }
        
        session.beginConfiguration()
        
        session.sessionPreset = .photo
        
        // Add video input.
        do {
            var defaultVideoDevice: AVCaptureDevice?
            
            if let backCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
                // If a rear dual camera is not available, default to the rear wide angle camera.
                defaultVideoDevice = backCameraDevice
            } else if let frontCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
                // If the rear wide angle camera isn't available, default to the front wide angle camera.
                defaultVideoDevice = frontCameraDevice
            }
            
            guard let videoDevice = defaultVideoDevice else {
                print("Default video device is unavailable.")
                setupResult = .configurationFailed
                session.commitConfiguration()
                return
            }
            
            let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)
            
            if session.canAddInput(videoDeviceInput) {
                session.addInput(videoDeviceInput)
                self.videoDeviceInput = videoDeviceInput
                
            } else {
                print("Couldn't add video device input to the session.")
                setupResult = .configurationFailed
                session.commitConfiguration()
                return
            }
        } catch {
            print("Couldn't create video device input: \(error)")
            setupResult = .configurationFailed
            session.commitConfiguration()
            return
        }
        
        // Add the photo output.
        if session.canAddOutput(photoOutput) {
            session.addOutput(photoOutput)
            
            photoOutput.maxPhotoQualityPrioritization = .quality
            
        } else {
            print("Could not add photo output to the session")
            setupResult = .configurationFailed
            session.commitConfiguration()
            return
        }
        
        session.commitConfiguration()
        
        self.isConfigured = true
        
        self.start()
    }
    
    //  MARK: Device Configuration
    
    /// - Tag: ChangeCamera
    public func changeCamera() {
        guard self.setupResult == .success else {
            return
        }
        //        MARK: Here disable all camera operation related buttons due to configuration is due upon and must not be interrupted
        DispatchQueue.main.async {
            self.isCameraButtonDisabled = true
        }
        //
        
        sessionQueue.async {
            let currentVideoDevice = self.videoDeviceInput.device
            let currentPosition = currentVideoDevice.position
            
            let preferredPosition: AVCaptureDevice.Position
            let preferredDeviceType: AVCaptureDevice.DeviceType
            
            switch currentPosition {
            case .unspecified, .front:
                preferredPosition = .back
                preferredDeviceType = .builtInWideAngleCamera
                
            case .back:
                preferredPosition = .front
                preferredDeviceType = .builtInWideAngleCamera
                
            @unknown default:
                print("Unknown capture position. Defaulting to back, dual-camera.")
                preferredPosition = .back
                preferredDeviceType = .builtInWideAngleCamera
            }
            let devices = self.videoDeviceDiscoverySession.devices
            var newVideoDevice: AVCaptureDevice? = nil
            
            // First, seek a device with both the preferred position and device type. Otherwise, seek a device with only the preferred position.
            if let device = devices.first(where: { $0.position == preferredPosition && $0.deviceType == preferredDeviceType }) {
                newVideoDevice = device
            } else if let device = devices.first(where: { $0.position == preferredPosition }) {
                newVideoDevice = device
            }
            
            if let videoDevice = newVideoDevice {
                do {
                    let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)
                    
                    self.session.beginConfiguration()
                    
                    // Remove the existing device input first, because AVCaptureSession doesn't support
                    // simultaneous use of the rear and front cameras.
                    self.session.removeInput(self.videoDeviceInput)
                    
                    if self.session.canAddInput(videoDeviceInput) {
                        self.session.addInput(videoDeviceInput)
                        self.videoDeviceInput = videoDeviceInput
                    } else {
                        self.session.addInput(self.videoDeviceInput)
                    }
                    
                    if let connection = self.photoOutput.connection(with: .video) {
                        if connection.isVideoStabilizationSupported {
                            connection.preferredVideoStabilizationMode = .auto
                        }
                    }
                    
                    self.photoOutput.maxPhotoQualityPrioritization = .quality
                    
                    self.session.commitConfiguration()
                } catch {
                    print("Error occurred while creating video device input: \(error)")
                }
            }
            
            DispatchQueue.main.async {
                //                MARK: Here enable capture button due to successfull setup
                self.isCameraButtonDisabled = false
            }
        }
    }
    
    public func focus(at focusPoint: CGPoint){
        //        let focusPoint = self.videoPreviewLayer.captureDevicePointConverted(fromLayerPoint: point)
        
        let device = self.videoDeviceInput.device
        do {
            try device.lockForConfiguration()
            if device.isFocusPointOfInterestSupported {
                device.focusPointOfInterest = focusPoint
                device.exposurePointOfInterest = focusPoint
                device.exposureMode = .continuousAutoExposure
                device.focusMode = .continuousAutoFocus
                device.unlockForConfiguration()
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    /// - Tag: Stop capture session
    
    public func stop(completion: (() -> ())? = nil) {
        sessionQueue.async {
            if self.isSessionRunning {
                if self.setupResult == .success {
                    self.session.stopRunning()
                    self.isSessionRunning = self.session.isRunning
                    
                    if !self.session.isRunning {
                        DispatchQueue.main.async {
                            self.isCameraButtonDisabled = true
                            self.isCameraUnavailable = true
                            completion?()
                        }
                    }
                }
            }
        }
    }
    
    /// - Tag: Start capture session
    
    public func start() {
        //        We use our capture session queue to ensure our UI runs smoothly on the main thread.
        sessionQueue.async {
            if !self.isSessionRunning && self.isConfigured {
                switch self.setupResult {
                case .success:
                    self.session.startRunning()
                    self.isSessionRunning = self.session.isRunning
                    
                    if self.session.isRunning {
                        DispatchQueue.main.async {
                            self.isCameraButtonDisabled = false
                            self.isCameraUnavailable = false
                        }
                    }
                    
                case .configurationFailed:
                    
                    print("Camera unavailable on this device")
                    
                    DispatchQueue.main.async {
                        self.error = .cameraUnavailable
                        self.isCameraButtonDisabled = true
                        self.isCameraUnavailable = true
                    }
                case .notAuthorized:
                    print("Application not authorized to use camera")
                    
                    DispatchQueue.main.async {
                        self.error = .permissionDenied
                        self.isCameraButtonDisabled = true
                        self.isCameraUnavailable = true
                    }
                }
            }
        }
    }
    
    public func set(zoom: CGFloat){
        let factor = zoom < 1 ? 1 : zoom
        let device = self.videoDeviceInput.device
        
        do {
            try device.lockForConfiguration()
            device.videoZoomFactor = factor
            device.unlockForConfiguration()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Capture Photo
    public func capturePhoto(saveToLibrary: Bool) {
        guard setupResult == .success else { return }
        
        isCameraButtonDisabled = true          // freeze UI while we shoot
        
        sessionQueue.async {
            // 1.  Lock the orientation on the photo connection
            if let connection = self.photoOutput.connection(with: .video) {
                connection.videoOrientation = .portrait
            }
            
            // 2.  Build the AVCapturePhotoSettings
            var photoSettings = AVCapturePhotoSettings()
            if self.photoOutput.availablePhotoCodecTypes.contains(.hevc) {
                photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])
            }
            
            if self.videoDeviceInput.device.isFlashAvailable {
                photoSettings.flashMode = self.flashMode
            }
            
            // ――――  iOS 17 / 16+ high‑resolution pathway  ――――
            if #available(iOS 17.0, *) {
                // New API: pick the largest supported dimensions explicitly
                if let maxDim = self.videoDeviceInput.device
                    .activeFormat
                    .supportedMaxPhotoDimensions
                    .last {
                    photoSettings.maxPhotoDimensions = maxDim
                    print("iOS 17+: using \(maxDim.width)×\(maxDim.height)")
                }
            } else {
                // Legacy flag (still works pre‑iOS 17)
                photoSettings.isHighResolutionPhotoEnabled = true
            }
            // ――――――――――――――――――――――――――――――――――――――――――――――
            
            // 3.  Thumbnail preview format
            if !photoSettings.__availablePreviewPhotoPixelFormatTypes.isEmpty {
                photoSettings.previewPhotoFormat = [
                    kCVPixelBufferPixelFormatTypeKey as String:
                        photoSettings.__availablePreviewPhotoPixelFormatTypes.first!
                ]
            }
            photoSettings.photoQualityPrioritization = .quality
            
            // 4.  Capture‑processor delegate
            let processor = PhotoCaptureProcessor(
                withSaveToLibrary: saveToLibrary,
                requestedPhotoSettings: photoSettings,
                willCapturePhotoAnimation: { [weak self] in
                    DispatchQueue.main.async {
                        self?.willCapturePhoto = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self?.willCapturePhoto = false
                    }
                },
                completionHandler: { [weak self] processor in
                    if let data = processor.photoData {
                        self?.photo = Photo(originalData: data)
                    }
                    self?.isCameraButtonDisabled = false
                    self?.sessionQueue.async {
                        self?.inProgressPhotoCaptureDelegates[processor.requestedPhotoSettings.uniqueID] = nil
                    }
                },
                photoProcessingHandler: { [weak self] animate in
                    self?.shouldShowSpinner = animate
                }
            )
            
            // 5.  Keep the delegate alive for the duration of the capture
            self.inProgressPhotoCaptureDelegates[processor.requestedPhotoSettings.uniqueID] = processor
            
            // 6.  Fire!
            self.photoOutput.capturePhoto(with: photoSettings, delegate: processor)
        }
    }
    
}   // ← ADD THIS — closes `public class CameraService {`
