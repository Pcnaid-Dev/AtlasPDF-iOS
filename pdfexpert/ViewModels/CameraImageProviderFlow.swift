//
//  CameraImageProviderFlow.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 06/09/23.
//

import Foundation
import Factory
import UIKit

extension Container {
    var cameraImageProviderFlow: Factory<CameraImageProviderFlow> {
        self { CameraImageProviderFlow() }
    }
}

class CameraImageProviderFlow: ObservableObject {
    
    typealias CameraImageTakenCallback = ((UIImage) -> ())
    
    @Published var cameraShow: Bool = false
    
    private var onImageTaken: CameraImageTakenCallback?
    
    func startFlow(onImageTaken: @escaping CameraImageTakenCallback) {
        self.onImageTaken = onImageTaken
        self.cameraShow = true
    }
    
    func onPhotoCaptured(image: UIImage) {
        self.cameraShow = false
        self.onImageTaken?(image)
    }
}
