


I. Root Directory (balzo-tech-pdfeasy-ios.git/)

README.md:
Functionality: Project overview, app description, features, setup instructions, technology stack.
Code Purpose: Documentation for developers and users.
Dependencies: None (documentation).
ci_scripts/:
Functionality: Continuous Integration (CI) scripts for automating build processes.
Code Purpose: ci_post_clone.sh: Shell script to be executed after cloning the repository in a CI environment. It handles setting up Firebase and Facebook configurations by injecting environment variables into plist files.
Dependencies: CI environment variables (CUSTOM_GOOGLE_SERVICE_INFO, CUSTOM_PROJECT_INFO).
pdfexpert/: This is the main application directory, containing all source code, resources, and project files for the iOS app.
pdfexpert/PdfExpert.entitlements:
Functionality: Entitlements file defining app capabilities (iCloud, App Groups, Associated Domains, Push Notifications).
Code Purpose: Configuration for system-level features.
Dependencies: Xcode project settings, iCloud, Share Extension.
pdfexpert/Applicaction/: Application lifecycle and global configurations.
pdfexpert/Applicaction/AppDelegate.swift:
Functionality: App delegate, handles app lifecycle events (launch, termination, scene sessions). Initializes Firebase, Facebook SDK, and attribution manager. Sets up global UI appearance.
Code Purpose: Application setup and initial configuration.
Dependencies: Firebase SDK, Facebook SDK, Factory (dependency injection), AttributionManager, ProjectInfo, ColorPalette, FontPalette.
pdfexpert/Applicaction/Constants.swift:
Functionality: Defines global constants, enums, and structs used throughout the app. Includes test flags, monetization settings, ChatPDF limits, review parameters, and miscellaneous app-wide constants (file types, sizes, URLs).
Code Purpose: Centralized configuration and constant values.
Dependencies: Foundation, CoreData, UniformTypeIdentifiers, PDFKit, Factory.
pdfexpert/Applicaction/PdfExpertApp.swift:
Functionality: SwiftUI App entry point. Creates the main ContentView and connects the AppDelegate.
Code Purpose: SwiftUI app structure.
Dependencies: SwiftUI, AppDelegate, ContentView.
pdfexpert/InternalUtils/: Utility classes for core functionalities, not directly UI-related but used internally.
pdfexpert/InternalUtils/ImageCropper.swift:
Functionality: SwiftUI wrapper for the Mantis image cropping library. Provides normal and no-rotation dial cropper types.
Code Purpose: Image cropping functionality.
Dependencies: Mantis, SwiftUI.
pdfexpert/InternalUtils/PdfScanUtility.swift:
Functionality: Converts VNDocumentCameraScan results to Pdf objects. Handles background PDF document creation from scanned images.
Code Purpose: Scan-to-PDF conversion logic.
Dependencies: Foundation, SwiftUI, PDFKit, Async.
pdfexpert/InternalUtils/PdfUtility.swift:
Functionality: Core PDF manipulation utilities: image-to-PDF conversion, PDF appending, thumbnail generation, applying post-processing (margins, compression), sharing PDF, password handling (unlock, remove password), widget detection.
Code Purpose: Core PDF processing logic.
Dependencies: Foundation, PDFKit, CoreData, K (Constants), MarginsOption, CompressionOption, Pdf, AsyncOperation, PdfError, MarginsOption, CompressionOption.
pdfexpert/InternalUtils/SharedErrors.swift:
Functionality: Defines custom error enums (SharedLocalizedError, SharedUnderlyingError, PdfError, AddPasswordError, RemovePasswordError, PdfSplitError) for consistent error handling throughout the app.
Code Purpose: Centralized error definitions.
Dependencies: Foundation.
pdfexpert/InternalUtils/SharedStorage.swift:
Functionality: Manages shared storage using App Groups and UserDefaults for communication between the main app and the Share Extension. Stores PDF data and flags for share extension workflows.
Code Purpose: Inter-process communication and shared data persistence.
Dependencies: Foundation.
pdfexpert/InternalUtils/SubscriptionViewUtility.swift:
Functionality: Utilities for handling StoreKit Product and SubscriptionPeriod objects. Provides methods for displaying prices, periods, discounts, and sorting subscriptions.
Code Purpose: Monetization and subscription logic utilities.
Dependencies: StoreKit, Collections.
pdfexpert/InternalUtils/View+Internal.swift:
Functionality: SwiftUI View extensions for common UI elements and functionalities used internally within the app (default buttons, disclaimers, camera permission alerts, subscription view handling, PDF sharing sheet, page counter, password removal confirmation, error alerts).
Code Purpose: Reusable UI components and View modifiers.
Dependencies: Foundation, SwiftUI, Factory, ColorPalette, FontPalette, K, SubscriptionPairsView, SubscriptionVerticalView, SubscriptionPickerView, ActivityViewController, Pdf, PDFUtility.
pdfexpert/InternalUtils/View+Preview.swift:
Functionality: SwiftUI View extensions for preview-related functionalities (preview orientation).
Code Purpose: Preview helpers.
Dependencies: Foundation, SwiftUI.
pdfexpert/Models/: Data models, entities, and business logic.
pdfexpert/Models/AppTrackingTransparency.swift & pdfexpert/Models/AppTrackingTransparencyImpl.swift:
Functionality: Protocol and implementation for requesting App Tracking Transparency (ATT) permission and updating Facebook Advertiser Tracking settings.
Code Purpose: User privacy and advertising attribution.
Dependencies: Foundation, Factory, AppTrackingTransparency, FacebookCore (conditional).
pdfexpert/Models/AttributionManager.swift & pdfexpert/Models/AttibutionManagerImpl.swift:
Functionality: Protocol and implementation for handling attribution using Branch SDK. Initializes Branch session, handles deep links, and reports ATT authorization status to Branch.
Code Purpose: Deeplinking and ad attribution tracking.
Dependencies: Foundation, Factory, BranchSDK, UIKit, AppTrackingTransparency.
pdfexpert/Models/ConfigService.swift & pdfexpert/Models/RemoteConfigManager.swift:
Functionality: Protocol and implementation for fetching and managing remote configuration using Firebase Remote Config. Fetches subscription view type.
Code Purpose: Remote configuration management.
Dependencies: Foundation, Combine, Factory, FirebaseRemoteConfig, CombineExt, SubscriptionViewType, K.
pdfexpert/Models/Store.swift & pdfexpert/Models/StoreImpl.swift:
Functionality: Protocol and implementation for managing in-app purchases using StoreKit 2. Handles product requests, purchases, transaction verification, and subscription status.
Code Purpose: In-app purchase and subscription management.
Dependencies: Foundation, StoreKit, Combine, Factory, StoreError, SubscriptionTier, ProductMetaViewsKey, getSubscriptionsForView, AnalyticsManager.
pdfexpert/Models/Analytics/: Analytics-related files.
pdfexpert/Models/Analytics/AnalyticsDefaultParameters.swift: Defines default parameters and extensions for tracking analytics events, including enums for tracking parameters, screens, and events, and extensions for MarginsOption, FileSource, AnalyticsScreen, AnalyticsEvent, AnalyticsError, AnalyticsPdfInputType, HomeAction, ImportOption, and CompressionOption to provide tracking parameter values and custom event names.
pdfexpert/Models/Analytics/AnalyticsManager.swift: Defines protocols and enums for analytics events, screens, and errors.
pdfexpert/Models/Analytics/AnalyticsManagerImpl.swift: Implements the AnalyticsManager protocol, using FirebaseAnalyticsPlatform and BranchAnalyticsPlatform to send analytics events to Firebase Analytics and Branch.
pdfexpert/Models/Analytics/AnalyticsPlatform.swift: Defines the AnalyticsPlatform protocol for different analytics platform implementations.
pdfexpert/Models/Analytics/BranchAnalyticsPlatform.swift: Implements AnalyticsPlatform protocol for Branch, using Branch SDK to track events and purchases.
pdfexpert/Models/Analytics/FirebaseAnalyticsPlatform.swift: Implements AnalyticsPlatform protocol for Firebase Analytics, using Firebase Analytics SDK to track events and screen views.
pdfexpert/Models/Entities/: Data entities.
pdfexpert/Models/Entities/ChatPdfInitParams.swift: Data structure for initializing ChatPDF with reference and setup data.
pdfexpert/Models/Entities/ChatPdfMessage.swift: Data structure for ChatPDF messages, including role, type, content, and suggested questions.
pdfexpert/Models/Entities/ChatPdfRef.swift: Data structure for referencing ChatPDF documents by source ID.
pdfexpert/Models/Entities/ChatPdfSetupData.swift: Data structure for ChatPDF setup data, including summary and suggested questions.
pdfexpert/Models/Entities/Pdf.swift: Data model for PDF documents, including PDFDocument, filename, password, creation date, compression, and margins. Implements Collection, Hashable, and Identifiable protocols.
pdfexpert/Models/Entities/PickedImage.swift: Data structure for picked images, conforming to Transferable for drag and drop and image picking.
pdfexpert/Models/Entities/ProjectInfo.swift: Class to access and validate project-specific information from ProjectInfo.plist, like ChatPDF API key.
pdfexpert/Models/Entities/Signature.swift: Data structure for signatures, including UIImage, store ID, and creation date.
pdfexpert/Models/Entities/SuggestedFields.swift: Data structure for suggested form fields data (first name, last name, etc.).
pdfexpert/Models/Network/: Network-related files.
pdfexpert/Models/Network/NetworkUtility.swift: Utility extensions for network requests, including string URL escaping, data formatting for JSON requests and responses, and date string conversions.
pdfexpert/Models/Network/ChatPdf/: Files related to ChatPDF API interactions.
pdfexpert/Models/Network/ChatPdf/ChatPdfManager.swift: Protocol for ChatPDF API interaction, defining methods for sending PDF, generating text, getting setup data, and deleting PDF.
pdfexpert/Models/Network/ChatPdf/ChatPdfManagerImpl.swift: Implementation of ChatPdfManager protocol using Moya for network requests. Handles API calls to ChatPDF service.
pdfexpert/Models/Network/ChatPdf/ChatPdfManagerMock.swift: Mock implementation of ChatPdfManager for testing purposes, with configurable network stubs and delays.
pdfexpert/Models/Network/ChatPdf/Mapping/: Mapping/Decodable extensions for ChatPDF entities.
pdfexpert/Models/Network/ChatPdf/Mapping/ChatPdfMessage+Decodable.swift: Decodable extension for ChatPdfMessage.
pdfexpert/Models/Network/ChatPdf/Mapping/ChatPdfRef+Decodable.swift: Decodable extension for ChatPdfRef.
pdfexpert/Models/Network/ChatPdf/Mapping/ChatPdfSetupData+Decodable.swift: Decodable extension for ChatPdfSetupData.
pdfexpert/Models/Persistence/: Persistence-related files using Core Data and UserDefaults.
pdfexpert/Models/Persistence/CacheManager.swift: Protocol for managing cached data using UserDefaults (onboarding shown flag, pre-review shown flag).
pdfexpert/Models/Persistence/CacheManagerImpl.swift: Implementation of CacheManager protocol using UserDefaults.standard.
pdfexpert/Models/Persistence/Repository.swift: Protocol defining repository methods for saving, loading, and deleting Pdf, Signature, and SuggestedFields entities.
pdfexpert/Models/Persistence/RepositoryImpl.swift: Implementation of Repository protocol using Core Data for persistent storage. Handles saving, loading, and deleting entities using Core Data context and CloudKit integration.
pdfexpert/Models/Persistence/CoreData/: Core Data entity definitions.
pdfexpert/Models/Persistence/CoreData/CDPdf.swift: Core Data entity definition for Pdf, with attributes for data, creation date, password, filename, compression, and margins.
pdfexpert/Models/Persistence/CoreData/CDSignature.swift: Core Data entity definition for Signature, with attributes for data and creation date.
pdfexpert/Models/Persistence/CoreData/CDSuggestedFields.swift: Core Data entity definition for SuggestedFields, with attributes for form fields data.
pdfexpert/Models/Persistence/CoreData/Persistence.swift: Sets up and manages Core Data persistent container with CloudKit integration. Includes initialization, schema setup, and handling remote changes.
pdfexpert/Models/Persistence/CoreData/Persistable/: Persistable protocol and concrete persistable implementations.
pdfexpert/Models/Persistence/CoreData/Persistable/Pdf+Persistable.swift: Persistable conformance for Pdf entity, defining methods to convert between Pdf model and CDPdf Core Data entity.
pdfexpert/Models/Persistence/CoreData/Persistable/Persistable.swift: Protocol defining the base requirements for persistable models, including Core Data entity association and conversion methods.
pdfexpert/Models/Persistence/CoreData/Persistable/Signature+Persistable.swift: Persistable conformance for Signature entity, defining methods to convert between Signature model and CDSignature Core Data entity.
pdfexpert/Models/Persistence/CoreData/Persistable/SuggestedFields+Persistable.swift: Persistable conformance for SuggestedFields entity, defining methods to convert between SuggestedFields model and CDSuggestedFields Core Data entity.
pdfexpert/Preview Content/: Assets for Xcode Previews.
pdfexpert/Preview Content/Preview Assets.xcassets/: Asset catalog for preview assets.
pdfexpert/Resources/: Resources for the app.
pdfexpert/Resources/InfoTemplate.plist: Template Info.plist file, likely for environment-specific configurations.
pdfexpert/Resources/Animations/: Lottie animation JSON files (loading.json, pdf-scanning.json).
pdfexpert/Resources/AppCoreData.xcdatamodeld/: Core Data model definition (PdfExpert.xcdatamodel).
pdfexpert/Resources/Assets.xcassets/: Main asset catalog for images and icons. Contains various image sets categorized by feature (edit, home, onboarding, subscription, etc.) and general assets.
pdfexpert/Resources/Colors.xcassets/: Color asset catalog defining app's color palette (Primary, Secondary, Text colors, gradients, etc.).
pdfexpert/Resources/Fonts/: Custom font files (Poppins TTF files in various weights and styles).
pdfexpert/Resources/IAP/: In-app purchase configuration files (.storekit and Products.plist). Includes different StoreKit configurations for staging, production, and local testing.
pdfexpert/Resources/Test/: Test PDF file (test.pdf).
pdfexpert/Style/: UI Style definitions.
pdfexpert/Style/AnimationPalette.swift: Defines AnimationType enum and LottieView for animation handling.
pdfexpert/Style/ColorPalette.swift: Defines ColorPalette class with static Color properties for app's color scheme.
pdfexpert/Style/FontPalette.swift: Defines FontPalette class with static methods to create Font and UIFont instances for various Poppins font styles and sizes. Also defines FontCategory enum for semantic font styles.
pdfexpert/Utils/: General utility classes and extensions.
pdfexpert/Utils/Async.swift: Defines structures and protocols for handling asynchronous operations and UI state management (AsyncOperation, AsyncLoadable, AsyncFailable).
pdfexpert/Utils/CombineUtils.swift: Combine framework extensions for publishers and subscribers, simplifying async status handling and data transformations.
pdfexpert/Utils/DebugUtils.swift: Utility functions for debugging, including elapsed time printing and debug printing with class/instance identification.
pdfexpert/Utils/MathUtils.swift: Utility class for mathematical operations, specifically related to lines and points in 2D space (slope, intercept, closest point on a line).
pdfexpert/Utils/ParentalCheck.swift: Enum for representing parental check status (checking, success).
pdfexpert/Utils/PDFImageExtractor.swift: Utility for extracting images embedded within PDF documents.
pdfexpert/Utils/Camera/: Camera-related utility files.
pdfexpert/Utils/Camera/CameraPreviewView.swift: SwiftUI UIViewRepresentable for displaying camera preview using AVCaptureVideoPreviewLayer.
pdfexpert/Utils/Camera/CameraService+Enums.swift: Enums related to CameraService for live photo mode, depth data delivery, portrait effects matte delivery, session setup result, and capture mode.
pdfexpert/Utils/Camera/CameraService+Extensions.swift: Extensions for AVCaptureVideoOrientation and AVCaptureDevice.DiscoverySession to add utility functionalities.
pdfexpert/Utils/Camera/CameraService.swift: Manages AVCaptureSession for camera functionality, handling setup, permissions, capture, zoom, flash, and photo output. Publishes Photo objects and CameraError for UI updates.
pdfexpert/Utils/Camera/ImageResizer.swift: Utility for resizing images to a target width while maintaining aspect ratio.
pdfexpert/Utils/Camera/PhotoCaptureProcessor.swift: AVCapturePhotoCaptureDelegate implementation to process captured photos, handle animations, completion and processing handlers, and saving to photo library.
pdfexpert/Utils/Extensions/: SwiftUI View and data type extensions.
pdfexpert/Utils/Extensions/Color+Extensions.swift: Extension for Color to initialize from hex strings.
pdfexpert/Utils/Extensions/CoreGraphics+Extensions.swift: Extension for CGSize to add aspect ratio calculation and size clipping functionality.
pdfexpert/Utils/Extensions/Enum+Extensions.swift: Extension for CaseIterable enums to add helper properties like index, next, previous, and totalCases.
pdfexpert/Utils/Extensions/Foundation+Extensions.swift: Extension for URL to get documents directory.
pdfexpert/Utils/Extensions/NSAttributedString+Extensions.swift: Extension for NSAttributedString and NSMutableAttributedString to trim characters from character sets.
pdfexpert/Utils/Extensions/ObservableObject+Extensions.swift: Extension for ObservableObject to create Binding for AsyncOperation properties.
pdfexpert/Utils/Extensions/PDFAnnotation+Extensions.swift: Extension for PDFAnnotation to add properties for text, widget, and signature annotations, image extraction, bounds calculation, and creation methods for text and signature annotations.
pdfexpert/Utils/Extensions/PdfDocument+Extensions.swift: Extension to make PDFDocument conform to Collection protocol for easier page iteration.
pdfexpert/Utils/Extensions/PencilKit+Extensions.swift: Extension for PKDrawing to create UIImage with user interface style awareness.
pdfexpert/Utils/Extensions/StoreKit+Extensions.swift: Extension for Product to add computed property isFreeTrial.
pdfexpert/Utils/Extensions/String+Extensions.swift: Extension for String to add utility methods like nilIfEmpty, capitalizingFirstLetter, and boundingRect calculations.
pdfexpert/Utils/Extensions/UIApplication+Extensions.swift: Extension for UIApplication to dismiss keyboard.
pdfexpert/Utils/Extensions/UIFont+Extensions.swift: Extension for UIFont to create fonts that fit within a given size and text.
pdfexpert/Utils/Extensions/URL+Extensions.swift: Extension for URL to extract filename from path.
pdfexpert/Utils/Extensions/View+Alert.swift: SwiftUI View extensions to show error alerts for AsyncOperation and AsyncFailable types.
pdfexpert/Utils/Extensions/View+Extensions.swift: SwiftUI View extensions for creating common UI elements (close button, edit button, back button, attributed text, system icons) and view modifiers for conditional application and action dialogs, and checking scroll-to availability.
pdfexpert/Utils/UI/: Reusable SwiftUI UI components.
pdfexpert/Utils/UI/ActivityViewController.swift: SwiftUI UIViewControllerRepresentable for presenting UIActivityViewController for sharing PDFs.
pdfexpert/Utils/UI/AsyncView.swift: SwiftUI View modifier for handling async operations and displaying loading and error states.
pdfexpert/Utils/UI/CircularProgressView.swift: SwiftUI View for displaying circular progress indicators.
pdfexpert/Utils/UI/FilePicker.swift: SwiftUI UIViewControllerRepresentable for presenting UIDocumentPickerViewController to pick files.
pdfexpert/Utils/UI/FormSheet.swift: SwiftUI UIViewControllerRepresentable and extensions for presenting views as form sheets (modal views in iPad style).
pdfexpert/Utils/UI/FullScreenClearBackground.swift: SwiftUI UIViewControllerRepresentable to create a full-screen view with a clear background for custom sheet presentations.
pdfexpert/Utils/UI/ImageAnnotationStamp.swift: Custom PDFAnnotation subclass for image stamps, used for signatures.
pdfexpert/Utils/UI/ImageResizableView.swift: SwiftUI View for displaying and resizing images with handles, used for signature placement.
pdfexpert/Utils/UI/LoadingView.swift: SwiftUI View modifier to show a loading overlay with a progress view while content is loading.
pdfexpert/Utils/UI/LottieView.swift: SwiftUI UIViewRepresentable for displaying Lottie animations.
pdfexpert/Utils/UI/PageControl.swift: SwiftUI UIViewRepresentable for displaying UIPageControl.
pdfexpert/Utils/UI/PdfKitView.swift: SwiftUI UIViewRepresentable for embedding PDFView and displaying PDF documents. Supports single-page mode, margins, current page setting, and tap gestures.
pdfexpert/Utils/UI/PdfKitViewBinder.swift: SwiftUI UIViewRepresentable to bind and update existing PDFView instances, allowing for SwiftUI-driven PDF view updates.
pdfexpert/Utils/UI/PencilKitView.swift: SwiftUI UIViewRepresentable for embedding PKCanvasView for signature drawing.
pdfexpert/Utils/UI/PopupView.swift: SwiftUI View modifier for presenting custom popup views with background dimming and transitions.
pdfexpert/Utils/UI/RoundedCorner.swift: SwiftUI Shape for creating views with rounded corners for specific corners.
pdfexpert/Utils/UI/SizePrinter.swift: SwiftUI ViewModifier for printing the size of a view to the console, useful for layout debugging.
pdfexpert/Utils/UI/TextResizableView.swift: SwiftUI View for displaying and resizing editable text fields with handles and suggested words, used for text annotations.
pdfexpert/Utils/UI/UnderlyingError.swift: Protocol for handling underlying errors and converting generic Error types to specific error enums.
pdfexpert/Utils/UI/ZoomImageModifier.swift: SwiftUI ViewModifier to enable pinch-to-zoom and double-tap zoom on images within a ScrollView.
pdfexpert/ViewModels/: ViewModels for SwiftUI Views.
pdfexpert/ViewModels/ArchiveViewModel.swift: ViewModel for ArchiveView, managing PDF list loading, deletion, and navigation to edit and share flows.
pdfexpert/ViewModels/CameraImageProviderFlow.swift: Manages the flow for providing images from the camera, handling camera presentation and image capture callbacks.
pdfexpert/ViewModels/CameraViewModel.swift: ViewModel for CameraView, controlling camera session, capturing photos, and handling camera errors and settings.
pdfexpert/ViewModels/ChatPdfSelectionViewModel.swift: ViewModel for ChatPdfSelectionView, managing PDF import options, initiating ChatPDF setup, and handling monetization flow for ChatPDF feature.
pdfexpert/ViewModels/ChatPdfViewModel.swift: ViewModel for ChatPdfView, managing ChatPDF message display, sending user prompts, receiving bot responses, and handling message history.
pdfexpert/ViewModels/GalleryImageProviderFlow.swift: Manages the flow for providing images from the photo gallery, handling image picker presentation and image selection callbacks.
pdfexpert/ViewModels/HomeViewModel.swift: ViewModel for HomeView, managing home screen actions, import options, PDF creation, and navigation to different flows (edit, merge, split, read, subscription).
pdfexpert/ViewModels/ImageCropFlow.swift: Manages the flow for image cropping using ImageCropper, handling cropper presentation and cropped image callbacks.
pdfexpert/ViewModels/OnboardingViewModel.swift: ViewModel for OnboardingView, managing onboarding flow, page navigation, and skipping onboarding.
pdfexpert/ViewModels/PdfEditViewModel.swift: ViewModel for PdfEditView, managing PDF editing functionalities: page manipulation, annotations, saving, sharing, password protection, and navigation within the edit flow.
pdfexpert/ViewModels/PdfFillFormViewModel.swift: ViewModel for PdfFillFormView, managing PDF form filling functionalities, text annotation creation and editing, and suggested fields integration.
pdfexpert/ViewModels/PdfFillWidgetViewModel.swift: ViewModel for PdfFillWidgetView, managing PDF form widget filling functionality and page navigation within the fill widget view.
pdfexpert/ViewModels/PdfImportMultipleViewModel.swift: ViewModel for importing multiple PDFs, handling file picking and passing PDFs to unlock view model if needed.
pdfexpert/ViewModels/PdfImportViewModel.swift: ViewModel for importing single PDFs, handling file picking and passing PDF to unlock view model if needed.
pdfexpert/ViewModels/PdfMergeViewModel.swift: ViewModel for PDF merging functionality, managing PDF import for merging and PDF sorting flow.
pdfexpert/ViewModels/PdfPageRangeEditorViewModel.swift: ViewModel for PdfPageRangeEditorView, managing page range input, validation, and confirmation for PDF splitting.
pdfexpert/ViewModels/PdfReaderViewModel.swift: ViewModel for PdfReaderView, managing PDF reading functionalities, page navigation, text mode switching, and image extraction.
pdfexpert/ViewModels/PdfReadViewModel.swift: ViewModel for initiating PDF reading flow, handling PDF import for reading.
pdfexpert/ViewModels/PdfSignatureCanvasViewModel.swift: ViewModel for PdfSignatureCanvasView, managing signature drawing canvas, image import, camera capture, signature saving, and confirmation callbacks.
pdfexpert/ViewModels/PdfSignaturePickerViewModel.swift: ViewModel for PdfSignaturePickerView, managing saved signature list display, deletion, selection, and navigation to signature creation flow.
pdfexpert/ViewModels/PdfSignaturePrioviderFlow.swift: Manages the flow for providing signatures, handling navigation between signature picker and signature creation views.
pdfexpert/ViewModels/PdfSignatureViewModel.swift: ViewModel for PdfSignatureView, managing PDF signature annotation functionalities, signature placement, resizing, deletion, and navigation to signature provider flow.
pdfexpert/ViewModels/PdfSortViewModel.swift: ViewModel for PdfSortView, managing PDF sorting functionality and confirmation/cancellation callbacks.
pdfexpert/ViewModels/PdfSplitViewModel.swift: ViewModel for PDF splitting functionality, managing page range editor presentation and PDF splitting logic.
pdfexpert/ViewModels/PdfUnlockViewModel.swift: ViewModel for unlocking password-protected PDFs, handling password input and decryption process.
pdfexpert/ViewModels/ReviewFlow.swift: Manages the review flow, including pre-review popups, low-rate feedback, and native review requests.
pdfexpert/ViewModels/SubscribeViewModel.swift: Base ViewModel for subscription views, handling premium status, purchase, and restore purchase actions.
pdfexpert/ViewModels/SubscriptionPairsViewModel.swift: ViewModel for SubscriptionPairsView, managing subscription plan pairs display, selection, and purchase flow.
pdfexpert/ViewModels/SubscriptionPickerViewModel.swift: ViewModel for SubscriptionPickerView, managing subscription plan picker display, plan selection, and purchase flow.
pdfexpert/ViewModels/SubscriptionVerticalViewModel.swift: ViewModel for SubscriptionVerticalView, managing vertical subscription plan list display, plan selection, and purchase flow.
pdfexpert/ViewModels/SuggestedFieldsFormViewModel.swift: ViewModel for SuggestedFieldsFormView, managing suggested form fields data input, validation, and saving.
pdfexpert/Views/Views/: SwiftUI Views for the application UI.
pdfexpert/Views/Views/ContentView.swift: Main content view, acts as root view, and handles app-level view presentation based on onboarding status and main tabs.
pdfexpert/Views/Views/Archive/: Views for the Archive/Files tab.
pdfexpert/Views/Views/Archive/ArchiveView.swift: View for displaying the list of archived PDFs, allowing editing, sharing, and deletion.
pdfexpert/Views/Views/Camera/: Views for camera functionality.
pdfexpert/Views/Views/Camera/CameraView.swift: View for displaying the camera preview, capture button, flip camera button, and flash control.
pdfexpert/Views/Views/ChatPdf/: Views related to ChatPDF feature.
pdfexpert/Views/Views/ChatPdf/ChatPdfSelectionView.swift: View for PDF selection to initiate ChatPDF chat, providing import options and displaying warnings about PDF limits.
pdfexpert/Views/Views/ChatPdf/ChatPdfView.swift: View for the ChatPDF chat interface, displaying messages, input field, and suggested questions.
pdfexpert/Views/Views/ChatPdf/MessageIndicatorView.swift: View for displaying loading indicator dots within chat messages.
pdfexpert/Views/Views/ChatPdf/MessageView.swift: View for displaying individual chat messages, differentiating between user and assistant messages, and handling suggested question taps.
pdfexpert/Views/Views/Common/: Reusable common UI views.
pdfexpert/Views/Views/Common/AddPasswordView.swift: ViewModifier for presenting an alert to add a password to a PDF.
pdfexpert/Views/Views/Common/CameraImageProviderFlowView.swift: ViewModifier to present camera view for image capture.
pdfexpert/Views/Views/Common/GalleryImageProviderFlowView.swift: ViewModifier to present photo gallery picker for image selection.
pdfexpert/Views/Views/Common/ImageCropFlowView.swift: ViewModifier to present image cropper view.
pdfexpert/Views/Views/Common/ImportOption.swift: SwiftUI View extensions and enums for defining import options and groups, and creating import option list views.
pdfexpert/Views/Views/Common/OptionItemView.swift: Reusable view for displaying a single option item with title and icon in a list.
pdfexpert/Views/Views/Common/OptionListView.swift: Reusable view for displaying a list of options with a title.
pdfexpert/Views/Views/Common/PdfImageViewerView.swift: View for displaying PDF page images in a zoomable view with pagination and image captions.
pdfexpert/Views/Views/Common/PdfImportMultipleView.swift: ViewModifier to present file picker for importing multiple PDFs.
pdfexpert/Views/Views/Common/PdfImportView.swift: ViewModifier to present file picker for importing a single PDF.
pdfexpert/Views/Views/Common/PdfMergeView.swift: ViewModifier to present PDF merge flow, including file picker and PDF sorting view.
pdfexpert/Views/Views/Common/PdfPageRangeEditorView.swift: View for editing page ranges for PDF splitting, allowing users to define page ranges with text fields and add/remove ranges.
pdfexpert/Views/Views/Common/PdfPageSelectionView.swift: View for selecting a page from a PDF document, displaying page thumbnails in a scrollable list.
pdfexpert/Views/Views/Common/PdfReaderView.swift: View for reading PDF documents, supporting text mode and image extraction.
pdfexpert/Views/Views/Common/PdfReadView.swift: ViewModifier to present PDF read flow, initiating PDF import for reading.
pdfexpert/Views/Views/Common/PdfShareView.swift: ViewModifier to present PDF sharing sheet and handle subscription monetization before sharing.
pdfexpert/Views/Views/Common/PdfSortView.swift: View for sorting PDFs in a list using drag and drop, used in PDF merge flow.
pdfexpert/Views/Views/Common/PdfSplitView.swift: ViewModifier to present PDF split flow, including file picker and page range editor.
pdfexpert/Views/Views/Common/PdfUnlockView.swift: ViewModifier to present password input alert for unlocking protected PDFs.
pdfexpert/Views/Views/Common/SuggestedFieldsFormView.swift: View for displaying and editing suggested form fields (first name, last name, etc.).
pdfexpert/Views/Views/Home/: Views for the Home tab.
pdfexpert/Views/Views/Home/HomeItemView.swift: Reusable view for displaying a home screen action item with title, description, and icon.
pdfexpert/Views/Views/Home/HomeView.swift: Main view for the Home tab, displaying a grid of action items categorized by functionality (Convert, Edit, Organize, etc.).
pdfexpert/Views/Views/ImportTutorial/: Views for the Import Tutorial flow.
pdfexpert/Views/Views/ImportTutorial/ImportTutorialPageView.swift: View for displaying a single page in the import tutorial, showing image, title, and description.
pdfexpert/Views/Views/ImportTutorial/ImportTutorialView.swift: View for the import tutorial, using PagerTabStripView to display multiple tutorial pages with onboarding instructions.
pdfexpert/Views/Views/Main/: Views for the main tab bar structure.
pdfexpert/Views/Views/Main/MainTabView.swift: Main tab view for the application, containing tabs for Archive, Home, and ChatPDF. Manages navigation and presentation of settings and PDF edit flows.
pdfexpert/Views/Views/Navigation/: Navigation-related views.
pdfexpert/Views/Views/Navigation/Deeplink.swift: Enum for handling deep links.
pdfexpert/Views/Views/Navigation/MainCoordinator.swift: Coordinator for the main app navigation flow, managing root view state (onboarding/main), tab selection, and presentation of settings and PDF edit flows.
pdfexpert/Views/Views/Navigation/PdfCoordinator.swift: Coordinator for PDF-related flows (edit, sign, fill form), managing navigation within PDF editing contexts.
pdfexpert/Views/Views/Navigation/PdfShareCoordinator.swift: Coordinator for PDF sharing flow, managing share sheet presentation and subscription monetization before sharing.
pdfexpert/Views/Views/Onboarding/: Views for the Onboarding flow.
pdfexpert/Views/Views/Onboarding/OnboardingPageView.swift: View for displaying a single onboarding page with image, title, and description.
pdfexpert/Views/Views/Onboarding/OnboardingView.swift: Main view for the onboarding flow, using PagerTabStripView to display multiple onboarding pages and handling continue/skip actions.
pdfexpert/Views/Views/Pdf/: Views related to PDF editing and viewing.
pdfexpert/Views/Views/Pdf/PdfCompressionPickerView.swift: View for picking PDF compression options using a list of radio-style buttons.
pdfexpert/Views/Views/Pdf/PdfEditView.swift: Main view for PDF editing, displaying PDF pages in a tab view, page thumbnails for navigation, edit action buttons, and handling various editing features (add page, signature, form filling, compression, etc.).
pdfexpert/Views/Views/Pdf/PdfFillFormView.swift: View for PDF form filling, displaying PDF pages with editable text annotation overlays, and handling text annotation creation and editing.
pdfexpert/Views/Views/Pdf/PdfFillWidgetView.swift: View for PDF widget filling, displaying PDF pages with interactive form widgets.
pdfexpert/Views/Views/Pdf/PdfFlowView.swift: Main container view for the PDF editing flow, embedding PdfEditView within a navigation stack and handling close warnings.
pdfexpert/Views/Views/Pdf/PdfSignatureCanvasView.swift: View for signature creation using PencilKit canvas, image import, and camera capture for signatures.
pdfexpert/Views/Views/Pdf/PdfSignaturePickerView.swift: View for picking saved signatures from a list, allowing deletion and navigation to signature creation view.
pdfexpert/Views/Views/Pdf/PdfSignatureProviderFlowView.swift: ViewModifier for presenting signature creation or picker views based on saved signature existence.
pdfexpert/Views/Views/Pdf/PdfSignatureView.swift: View for PDF signature annotation, displaying PDF pages with image resizable view overlay for signature placement and handling signature annotation creation and editing.
pdfexpert/Views/Views/Review/: Views for the Review flow.
pdfexpert/Views/Views/Review/PreReviewPopupLowRateView.swift: View for low-rate pre-review popup, prompting users for feedback on low ratings.
pdfexpert/Views/Views/Review/PreReviewPopupView.swift: View for pre-review popup, prompting users to rate the app before native review prompt.
pdfexpert/Views/Views/Review/ReviewFlowView.swift: ViewModifier to present the review flow, handling pre-review and low-rate feedback popups and triggering native review prompt.
pdfexpert/Views/Views/Scan/: Views for scanning functionality.
pdfexpert/Views/Views/Scan/ScannerView.swift: SwiftUI UIViewControllerRepresentable for presenting VNDocumentCameraViewController for document scanning.
pdfexpert/Views/Views/Settings/: Views for the Settings screen.
pdfexpert/Views/Views/Settings/SettingsView.swift: View for the Settings screen, displaying links to Privacy Policy and Terms and Conditions.
pdfexpert/Views/Views/Subscription/: Views related to Subscription monetization.
pdfexpert/Views/Views/Subscription/SubscriptionErrorView.swift: View to display a generic subscription error message with a retry button.
pdfexpert/Views/Views/Subscription/SubscriptionFreeTrialToggleView.swift: View for toggling free trial option in subscription views.
pdfexpert/Views/Views/Subscription/SubscriptionPairsItemView.swift: Reusable view for displaying a subscription plan pair item in a horizontal layout, used in SubscriptionPairsView.
pdfexpert/Views/Views/Subscription/SubscriptionPairsView.swift: View for displaying subscription options in pairs (yearly vs monthly), allowing users to select a plan and subscribe.
pdfexpert/Views/Views/Subscription/SubscriptionPickerPlanListView.swift: View for displaying a list of subscription plans in a sheet, used within SubscriptionPickerView.
pdfexpert/Views/Views/Subscription/SubscriptionPickerPlanView.swift: Reusable view for displaying a single subscription plan in a picker-style layout, used in SubscriptionPickerView.
pdfexpert/Views/Views/Subscription/SubscriptionPickerView.swift: View for displaying subscription options in a picker-style layout, allowing users to select a plan and subscribe, and presenting a plan list sheet.
pdfexpert/Views/Views/Subscription/SubscriptionVerticalItemView.swift: Reusable view for displaying a subscription plan item in a vertical layout, used in SubscriptionVerticalView.
pdfexpert/Views/Views/Subscription/SubscriptionVerticalView.swift: View for displaying subscription options in a vertical list layout, highlighting a specific plan based on view mode (long period or short period).
pdfexpert/Views/Views/Welcome/: Views for the Welcome/Onboarding screen.
pdfexpert/Views/Views/Welcome/WelcomeView.swift: View for the initial welcome screen, displayed before onboarding or main app content.
pdfexpert/pdfexpert.xcodeproj/: Xcode project files.
pdfexpert/pdfexpert.xcodeproj/project.pbxproj: Xcode project file, containing project structure, build settings, and file references.
pdfexpert/pdfexpert.xcodeproj/project.xcworkspace/: Xcode workspace settings.
pdfexpert/pdfexpert.xcodeproj/xcshareddata/: Shared Xcode workspace data (schemes, etc.).
ShareFileExtension/: Xcode project files and source code for the ShareFileExtension.
ShareFileExtension/ShareFileExtension.entitlements: Entitlements file for the ShareFileExtension target.
ShareFileExtension/ShareViewController.swift: View Controller for the Share Extension, handling PDF file reception from other apps, unlocking password-protected PDFs, and sharing PDFs to the main app.
ShareFileExtension/Base.lproj/: Localization resources for the Share Extension.
ShareFileExtension/Resources/: Resources for the Share Extension (Info.plist for different environments).
