
App Directory

Directory structure:
└── balzo-tech-pdfeasy-ios.git/
    ├── README.md
    ├── ci_scripts/
    │   └── ci_post_clone.sh
    ├── pdfexpert/
    │   ├── PdfExpert.entitlements
    │   ├── Applicaction/
    │   │   ├── AppDelegate.swift
    │   │   ├── Constants.swift
    │   │   └── PdfExpertApp.swift
    │   ├── InternalUtils/
    │   │   ├── ImageCropper.swift
    │   │   ├── PdfScanUtility.swift
    │   │   ├── PdfUtility.swift
    │   │   ├── SharedErrors.swift
    │   │   ├── SharedStorage.swift
    │   │   ├── SubscriptionViewUtility.swift
    │   │   ├── View+Internal.swift
    │   │   └── View+Preview.swift
    │   ├── Models/
    │   │   ├── AppTrackingTransparency.swift
    │   │   ├── AppTrackingTransparencyImpl.swift
    │   │   ├── AttibutionManagerImpl.swift
    │   │   ├── AttributionManager.swift
    │   │   ├── ConfigService.swift
    │   │   ├── RemoteConfigManager.swift
    │   │   ├── Store.swift
    │   │   ├── StoreImpl.swift
    │   │   ├── Analytics/
    │   │   │   ├── AnalyticsDefaultParameters.swift
    │   │   │   ├── AnalyticsManager.swift
    │   │   │   ├── AnalyticsManagerImpl.swift
    │   │   │   ├── AnalyticsPlatform.swift
    │   │   │   ├── BranchAnalyticsPlatform.swift
    │   │   │   └── FirebaseAnalyticsPlatform.swift
    │   │   ├── Entities/
    │   │   │   ├── ChatPdfInitParams.swift
    │   │   │   ├── ChatPdfMessage.swift
    │   │   │   ├── ChatPdfRef.swift
    │   │   │   ├── ChatPdfSetupData.swift
    │   │   │   ├── Pdf.swift
    │   │   │   ├── PickedImage.swift
    │   │   │   ├── ProjectInfo.swift
    │   │   │   ├── Signature.swift
    │   │   │   └── SuggestedFields.swift
    │   │   ├── Network/
    │   │   │   ├── NetworkUtility.swift
    │   │   │   └── ChatPdf/
    │   │   │       ├── ChatPdfManager.swift
    │   │   │       ├── ChatPdfManagerImpl.swift
    │   │   │       ├── ChatPdfManagerMock.swift
    │   │   │       └── Mapping/
    │   │   │           ├── ChatPdfMessage+Decodable.swift
    │   │   │           ├── ChatPdfRef+Decodable.swift
    │   │   │           └── ChatPdfSetupData+Decodable.swift
    │   │   └── Persistence/
    │   │       ├── CacheManager.swift
    │   │       ├── CacheManagerImpl.swift
    │   │       ├── Repository.swift
    │   │       ├── RepositoryImpl.swift
    │   │       └── CoreData/
    │   │           ├── CDPdf.swift
    │   │           ├── CDSignature.swift
    │   │           ├── CDSuggestedFields.swift
    │   │           ├── Persistence.swift
    │   │           └── Persistable/
    │   │               ├── Pdf+Persistable.swift
    │   │               ├── Persistable.swift
    │   │               ├── Signature+Persistable.swift
    │   │               └── SuggestedFields+Persistable.swift
    │   ├── Preview Content/
    │   │   └── Preview Assets.xcassets/
    │   │       └── Contents.json
    │   ├── Resources/
    │   │   ├── InfoTemplate.plist
    │   │   ├── Animations/
    │   │   │   ├── loading.json
    │   │   │   └── pdf-scanning.json
    │   │   ├── AppCoreData.xcdatamodeld/
    │   │   │   ├── .xccurrentversion
    │   │   │   └── PdfExpert.xcdatamodel/
    │   │   │       └── contents
    │   │   ├── Assets.xcassets/
    │   │   │   ├── Contents.json
    │   │   │   ├── AccentColor.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── AppIcon.appiconset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── AppIconStaging.appiconset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── archive_empty.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── camera.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_add_file.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_add_text.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_compression.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_fill_form.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_margins.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_option_compress.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_option_password_lock.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_option_password_unlock.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_option_split.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── edit_signature.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── file.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── gallery.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_add_password.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_add_text.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_create_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_excel_to_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_file_source_dropbox.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_file_source_files.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_file_source_google.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_file_source_icloud.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_fill_form.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_image_to_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_import_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_merge.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_power_to_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_read.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_remove_password.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_scan.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_sign.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_split.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── home_word_to_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── import_tutorial_1.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── import_tutorial_2.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── import_tutorial_3.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── info.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── logo_large.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── manage_annotations.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── manage_widget.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── onboarding_chat_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── onboarding_convert.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── onboarding_password.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── onboarding_signature.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── page_selection.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── password_entered.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── password_missing.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── review_low_rate.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── scan.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── settings.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── sign_drawing.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── signature.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── Subscription/
    │   │   │   │   ├── Contents.json
    │   │   │   │   ├── subscription_feature_chat_pdf.imageset/
    │   │   │   │   │   └── Contents.json
    │   │   │   │   ├── subscription_feature_convert.imageset/
    │   │   │   │   │   └── Contents.json
    │   │   │   │   ├── subscription_feature_edit.imageset/
    │   │   │   │   │   └── Contents.json
    │   │   │   │   ├── subscription_feature_password.imageset/
    │   │   │   │   │   └── Contents.json
    │   │   │   │   └── subscription_feature_signature.imageset/
    │   │   │   │       └── Contents.json
    │   │   │   ├── subscription_error.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── suggested_fields.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── tab_archive.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── tab_chat_pdf.imageset/
    │   │   │   │   └── Contents.json
    │   │   │   └── tab_home.imageset/
    │   │   │       └── Contents.json
    │   │   ├── Colors.xcassets/
    │   │   │   ├── Contents.json
    │   │   │   ├── Extra.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── FourthText.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── Primary.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── PrimaryBG.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── PrimaryText.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── SecondaryBG.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── SecondaryText.colorset/
    │   │   │   │   └── Contents.json
    │   │   │   ├── Specific/
    │   │   │   │   ├── Contents.json
    │   │   │   │   ├── ButtonGradientEnd.colorset/
    │   │   │   │   │   └── Contents.json
    │   │   │   │   └── ButtonGradientStart.colorset/
    │   │   │   │       └── Contents.json
    │   │   │   └── ThirdText.colorset/
    │   │   │       └── Contents.json
    │   │   ├── Fonts/
    │   │   │   ├── Poppins-Black.ttf
    │   │   │   ├── Poppins-BlackItalic.ttf
    │   │   │   ├── Poppins-Bold.ttf
    │   │   │   ├── Poppins-BoldItalic.ttf
    │   │   │   ├── Poppins-ExtraBold.ttf
    │   │   │   ├── Poppins-ExtraBoldItalic.ttf
    │   │   │   ├── Poppins-ExtraLight.ttf
    │   │   │   ├── Poppins-ExtraLightItalic.ttf
    │   │   │   ├── Poppins-Italic.ttf
    │   │   │   ├── Poppins-Light.ttf
    │   │   │   ├── Poppins-LightItalic.ttf
    │   │   │   ├── Poppins-Medium.ttf
    │   │   │   ├── Poppins-MediumItalic.ttf
    │   │   │   ├── Poppins-Regular.ttf
    │   │   │   ├── Poppins-SemiBold.ttf
    │   │   │   ├── Poppins-SemiBoldItalic.ttf
    │   │   │   ├── Poppins-Thin.ttf
    │   │   │   └── Poppins-ThinItalic.ttf
    │   │   ├── IAP/
    │   │   │   ├── EmptyProducts.storekit
    │   │   │   ├── LocalProductionProducts.storekit
    │   │   │   ├── LocalStagingProducts.storekit
    │   │   │   ├── ProductionProducts.storekit
    │   │   │   ├── Products.plist
    │   │   │   └── StagingProducts.storekit
    │   │   └── Test/
    │   ├── Style/
    │   │   ├── AnimationPalette.swift
    │   │   ├── ColorPalette.swift
    │   │   └── FontPalette.swift
    │   ├── Utils/
    │   │   ├── Async.swift
    │   │   ├── CombineUtils.swift
    │   │   ├── DebugUtils.swift
    │   │   ├── MathUtils.swift
    │   │   ├── ParentalCheck.swift
    │   │   ├── PDFImageExtractor.swift
    │   │   ├── Camera/
    │   │   │   ├── CameraPreviewView.swift
    │   │   │   ├── CameraService+Enums.swift
    │   │   │   ├── CameraService+Extensions.swift
    │   │   │   ├── CameraService.swift
    │   │   │   ├── ImageResizer.swift
    │   │   │   └── PhotoCaptureProcessor.swift
    │   │   ├── Extensions/
    │   │   │   ├── Color+Extensions.swift
    │   │   │   ├── CoreGraphics+Extensions.swift
    │   │   │   ├── Enum+Extensions.swift
    │   │   │   ├── Foundation+Extensions.swift
    │   │   │   ├── NSAttributedString+Extensions.swift
    │   │   │   ├── ObservableObject+Extensions.swift
    │   │   │   ├── PDFAnnotation+Extensions.swift
    │   │   │   ├── PdfDocument+Extensions.swift
    │   │   │   ├── PencilKit+Extensions.swift
    │   │   │   ├── StoreKit+Extensions.swift
    │   │   │   ├── String+Extensions.swift
    │   │   │   ├── UIApplication+Extensions.swift
    │   │   │   ├── UIFont+Extensions.swift
    │   │   │   ├── URL+Extensions.swift
    │   │   │   ├── View+Alert.swift
    │   │   │   └── View+Extensions.swift
    │   │   └── UI/
    │   │       ├── ActivityViewController.swift
    │   │       ├── AsyncView.swift
    │   │       ├── CircularProgressView.swift
    │   │       ├── FilePicker.swift
    │   │       ├── FormSheet.swift
    │   │       ├── FullScreenClearBackground.swift
    │   │       ├── ImageAnnotationStamp.swift
    │   │       ├── ImageResizableView.swift
    │   │       ├── LoadingView.swift
    │   │       ├── LottieView.swift
    │   │       ├── PageControl.swift
    │   │       ├── PdfKitView.swift
    │   │       ├── PdfKitViewBinder.swift
    │   │       ├── PencilKitView.swift
    │   │       ├── PopupView.swift
    │   │       ├── RoundedCorner.swift
    │   │       ├── SizePrinter.swift
    │   │       ├── TextResizableView.swift
    │   │       ├── UnderlyingError.swift
    │   │       └── ZoomImageModifier.swift
    │   ├── ViewModels/
    │   │   ├── ArchiveViewModel.swift
    │   │   ├── CameraImageProviderFlow.swift
    │   │   ├── CameraViewModel.swift
    │   │   ├── ChatPdfSelectionViewModel.swift
    │   │   ├── ChatPdfViewModel.swift
    │   │   ├── GalleryImageProviderFlow.swift
    │   │   ├── HomeViewModel.swift
    │   │   ├── ImageCropFlow.swift
    │   │   ├── OnboardingViewModel.swift
    │   │   ├── PdfEditViewModel.swift
    │   │   ├── PdfFillFormViewModel.swift
    │   │   ├── PdfFillWidgetViewModel.swift
    │   │   ├── PdfImportMultipleViewModel.swift
    │   │   ├── PdfImportViewModel.swift
    │   │   ├── PdfMergeViewModel.swift
    │   │   ├── PdfPageRangeEditorViewModel.swift
    │   │   ├── PdfReaderViewModel.swift
    │   │   ├── PdfReadViewModel.swift
    │   │   ├── PdfSignatureCanvasViewModel.swift
    │   │   ├── PdfSignaturePickerViewModel.swift
    │   │   ├── PdfSignaturePrioviderFlow.swift
    │   │   ├── PdfSignatureViewModel.swift
    │   │   ├── PdfSortViewModel.swift
    │   │   ├── PdfSplitViewModel.swift
    │   │   ├── PdfUnlockViewModel.swift
    │   │   ├── ReviewFlow.swift
    │   │   ├── SubscribeViewModel.swift
    │   │   ├── SubscriptionPairsViewModel.swift
    │   │   ├── SubscriptionPickerViewModel.swift
    │   │   ├── SubscriptionVerticalViewModel.swift
    │   │   └── SuggestedFieldsFormViewModel.swift
    │   └── Views/
    │       ├── ContentView.swift
    │       ├── Archive/
    │       │   └── ArchiveView.swift
    │       ├── Camera/
    │       │   └── CameraView.swift
    │       ├── ChatPdf/
    │       │   ├── ChatPdfSelectionView.swift
    │       │   ├── ChatPdfView.swift
    │       │   ├── MessageIndicatorView.swift
    │       │   └── MessageView.swift
    │       ├── Common/
    │       │   ├── AddPasswordView.swift
    │       │   ├── CameraImageProviderFlowView.swift
    │       │   ├── GalleryImageProviderFlowView.swift
    │       │   ├── ImageCropFlowView.swift
    │       │   ├── ImportOption.swift
    │       │   ├── OptionItemView.swift
    │       │   ├── OptionListView.swift
    │       │   ├── PdfImageViewerView.swift
    │       │   ├── PdfImportMultipleView.swift
    │       │   ├── PdfImportView.swift
    │       │   ├── PdfMergeView.swift
    │       │   ├── PdfPageRangeEditorView.swift
    │       │   ├── PdfPageSelectionView.swift
    │       │   ├── PdfReaderView.swift
    │       │   ├── PdfReadView.swift
    │       │   ├── PdfShareView.swift
    │       │   ├── PdfSortView.swift
    │       │   ├── PdfSplitView.swift
    │       │   ├── PdfUnlockView.swift
    │       │   └── SuggestedFieldsFormView.swift
    │       ├── Home/
    │       │   ├── HomeItemView.swift
    │       │   └── HomeView.swift
    │       ├── ImportTutorial/
    │       │   ├── ImportTutorialPageView.swift
    │       │   └── ImportTutorialView.swift
    │       ├── Main/
    │       │   └── MainTabView.swift
    │       ├── Navigation/
    │       │   ├── Deeplink.swift
    │       │   ├── MainCoordinator.swift
    │       │   ├── PdfCoordinator.swift
    │       │   └── PdfShareCoordinator.swift
    │       ├── Onboarding/
    │       │   ├── OnboardingPageView.swift
    │       │   └── OnboardingView.swift
    │       ├── Pdf/
    │       │   ├── PdfCompressionPickerView.swift
    │       │   ├── PdfEditView.swift
    │       │   ├── PdfFillFormView.swift
    │       │   ├── PdfFillWidgetView.swift
    │       │   ├── PdfFlowView.swift
    │       │   ├── PdfSignatureCanvasView.swift
    │       │   ├── PdfSignaturePickerView.swift
    │       │   ├── PdfSignatureProviderFlowView.swift
    │       │   └── PdfSignatureView.swift
    │       ├── Review/
    │       │   ├── PreReviewPopupLowRateView.swift
    │       │   ├── PreReviewPopupView.swift
    │       │   └── ReviewFlowView.swift
    │       ├── Scan/
    │       │   └── ScannerView.swift
    │       ├── Settings/
    │       │   └── SettingsView.swift
    │       ├── Subscription/
    │       │   ├── SubscriptionErrorView.swift
    │       │   ├── SubscriptionFreeTrialToggleView.swift
    │       │   ├── SubscriptionPairsItemView.swift
    │       │   ├── SubscriptionPairsView.swift
    │       │   ├── SubscriptionPickerPlanListView.swift
    │       │   ├── SubscriptionPickerPlanView.swift
    │       │   ├── SubscriptionPickerView.swift
    │       │   ├── SubscriptionVerticalItemView.swift
    │       │   └── SubscriptionVerticalView.swift
    │       └── Welcome/
    │           └── WelcomeView.swift
    ├── pdfexpert.xcodeproj/
    │   ├── project.pbxproj
    │   ├── project.xcworkspace/
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata/
    │   │       ├── IDEWorkspaceChecks.plist
    │   │       └── swiftpm/
    │   │           └── Package.resolved
    │   └── xcshareddata/
    │       └── xcschemes/
    │           ├── PdfExpert Staging.xcscheme
    │           ├── PdfExpert.xcscheme
    │           └── ShareFileExtension.xcscheme
    └── ShareFileExtension/
        ├── ShareFileExtension.entitlements
        ├── ShareViewController.swift
        ├── Base.lproj/
        │   └── MainInterface.storyboard
        └── Resources/
            ├── Production/
            │   └── Info.plist
            └── Staging/
                └── Info.plist
