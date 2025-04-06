
I. Essential Services (Required for Core Functionality or Monetization):

Apple App Store Connect & StoreKit (In-App Purchases):
Service: Apple App Store Connect (https://appstoreconnect.apple.com/) and Apple's StoreKit 2 framework (implicitly Apple's servers).
Functionality: Enables in-app subscriptions for unlocking premium features (like the share feature mentioned in README.md). Manages product definitions, pricing, and transaction processing.
Setup Required:
Apple Developer Account: You must have an active Apple Developer Program membership.
App Store Connect Configuration:
Create App Record: Create an app record in App Store Connect for your "PDF Expert" app. This is where you manage app metadata, builds, pricing, and IAP.
Configure In-App Purchases: Define your subscription products (e.g., Yearly, Monthly, Weekly) in App Store Connect. Ensure the Product IDs you create exactly match the Product IDs used in the StoreKit configuration files within the Xcode project (pdfexpert/Resources/IAP/*.storekit and Products.plist).
Set up Agreements, Tax, and Banking: Complete the necessary legal and financial agreements in App Store Connect to sell in-app purchases.
Xcode Configuration:
Bundle Identifier: Ensure your app's Bundle Identifier in Xcode matches the one you created in App Store Connect.
Signing & Capabilities: Enable the "In-App Purchase" capability in your Xcode project's Signing & Capabilities settings.
StoreKit Configuration Files: Xcode uses .storekit files to simulate the App Store during development. Ensure the ProductionProducts.storekit, StagingProducts.storekit, LocalProductionProducts.storekit, and LocalStagingProducts.storekit files in your Xcode project accurately reflect the Product IDs you configured in App Store Connect (especially for Production and Staging environments).
Firebase (Analytics, Crashlytics, Remote Config):
Service: Google Firebase (https://firebase.google.com/)
Firebase Analytics: Tracks user behavior within the app (events, screen views, user demographics).
Firebase Crashlytics: Provides crash reporting and helps diagnose app stability issues.
Firebase Remote Config: Allows remote configuration of app features (used to switch between subscription screen types).
Functionality: App analytics, crash reporting, remote feature configuration. Essential for understanding app usage, identifying errors, and A/B testing subscription screens.
Setup Required:
Firebase Project: Create a Firebase project in the Firebase Console.
Register iOS Apps: Within your Firebase project, register two iOS apps: one for your "PdfExpert" app (using your Production Bundle Identifier) and another for your "PdfExpert Staging" app (using your Staging Bundle Identifier).
Download GoogleService-Info.plist: For each of your Firebase iOS apps (Production and Staging), download the GoogleService-Info.plist configuration file.
File Placement (as detailed in previous answers): Place the correct GoogleService-Info.plist files in pdfexpert/Resources/Production and pdfexpert/Resources/Staging folders.
Firebase Console Configuration: Explore the Firebase Console to set up analytics dashboards, crashlytics reporting, and remote config parameters (if you intend to modify the subscription view type remotely).
II. Optional Services (Enhancements & Features, Decide if Needed):

ChatPDF API (AI PDF Interaction - Premium Feature):
Service: ChatPDF API (https://chatpdf.com/api)
Functionality: Powers the "Chat with PDF AI" premium feature. Allows users to upload PDFs to ChatPDF's servers and interact with them using natural language questions.
Setup Required:
ChatPDF Account: Create an account on https://chatpdf.com/.
Obtain API Key: Get your API key from the ChatPDF dashboard/settings.
Configure API Key in ProjectInfo.plist: As detailed previously, place your ChatPDF API key into the CHAT_PDF_API_KEY value in pdfexpert/Resources/ProjectInfo.plist.
Usage & Billing: Understand ChatPDF API's usage limits and billing structure, especially if you plan to offer the ChatPDF feature widely.
Branch SDK (Attribution & Deep Linking):
Service: Branch (https://branch.io/)
Attribution: Tracks where app users are coming from (e.g., Facebook Ads, other marketing campaigns).
Deep Linking: Enables opening the app via links and handling deferred deep linking (handling links even if the app isn't installed yet).
Functionality: Marketing attribution, user referrals, deep linking. Optional if you don't heavily rely on paid marketing or deep links.
Setup Required:
Branch Account: Create a Branch account on https://branch.io/.
Branch Dashboard Configuration: Set up your app in the Branch dashboard and configure your deep link structure and attribution settings.
SDK Key (Likely Implicit): While not explicitly mentioned in the provided code, Branch SDKs usually require an SDK key or app ID to be configured. Check Branch documentation for iOS SDK setup and look for where this might be configured in the codebase (likely in AttributionManagerImpl.swift or AppDelegate.swift, though it might be through plist configuration not shown in the snippets).
Associated Domains: Ensure associated domains are set up correctly in your app's entitlements (pdfexpert/PdfExpert.entitlements) and in your Branch dashboard for deep linking to function.
Facebook SDK (Ads Attribution - Optional):
Service: Facebook for Developers (https://developers.facebook.com/) & Facebook Ads Manager.
Functionality: Attribution for Facebook Ads campaigns. Helps track ad performance and return on ad spend. Optional if you don't advertise on Facebook.
Setup Required:
Facebook App: Create a Facebook App on the Facebook for Developers portal.
Facebook App ID & Client Token: Obtain these from your Facebook App settings.
Configure Info.plist files (as detailed previously): Add your Facebook App ID and Client Token to pdfexpert/Resources/InfoTemplate.plist, pdfexpert/Resources/Staging/Info.plist, and pdfexpert/Resources/Production/Info.plist.
Facebook Ads Manager: If you intend to run Facebook Ads, you'll need to use Facebook Ads Manager to create and manage your ad campaigns and connect them to your Facebook App.
iCloud (Optional, but likely desired):
Service: Apple iCloud & CloudKit.
Functionality: iCloud sync for storing and accessing created PDFs across user's devices. Highly recommended for a PDF management app to provide user convenience and data persistence.
Setup Required:
Apple Developer Account: Again, you need an active Apple Developer Program membership.
iCloud Container:
Create iCloud Container: In your Apple Developer account, create an iCloud Container. Note down the Container Identifier.
Xcode Entitlements: In Xcode, enable the "iCloud" capability for both the "PdfExpert" and "ShareFileExtension" targets. Select your team and choose the iCloud Container you created under "CloudKit Containers".
Update Entitlements Files: Verify and update com.apple.developer.icloud-container-identifiers in pdfexpert/PdfExpert.entitlements and ShareFileExtension/ShareFileExtension.entitlements to match your iCloud Container Identifier.
III. Infrastructure - Less Direct Setup (But Rely on Apple/Third-Party):

Apple Push Notification service (APNs) & Firebase Cloud Messaging (FCM - if used):
Service: Apple Push Notification service (APNs) & potentially Firebase Cloud Messaging (FCM) if Firebase Notifications are used (needs code verification).
Functionality: Push notifications (though the codebase doesn't explicitly show usage of push notifications beyond entitlements, the PdfExpert.entitlements file does include aps-environment). Push notifications are typically used for user engagement, subscription reminders, or other app-related notifications.
Setup Required (If Implementing Push Notifications):
Enable Push Notifications Capability: Enable the "Push Notifications" capability in Xcode's "Signing & Capabilities" for the "PdfExpert" target.
APNs Certificates: Configure APNs certificates in your Apple Developer account and upload them to your Firebase project if using FCM for push notifications.
Server-Side Implementation (If Sending Notifications from Your Backend): If you plan to send push notifications from your own backend server, you'll need to implement server-side APNs or FCM integration using your APNs certificates or Firebase Server Key.
Code Implementation: Implement code in your app to handle push notification registration, receiving notifications, and user permissions.
Cloud Storage APIs (Google Drive, Dropbox, iCloud Drive, Files App):
Service: Google Drive API, Dropbox API, iCloud Drive (iOS built-in), Files App (iOS built-in).
Functionality: Allows users to import PDFs and other files from cloud storage services and the iOS Files app.
Setup Required (If Implementing Cloud Service APIs beyond Files App/iCloud Drive):
Google Developer Console (Google Drive API): If you want developer-level access or deeper integration with Google Drive beyond the standard Files app integration, you might need to set up a Google Developer Console project, enable the Google Drive API, and obtain API credentials. However, for basic file picking from Google Drive using the Files app integration, this might not be necessary.
Dropbox Developer Console (Dropbox API): Similar to Google Drive, if you want deeper Dropbox API integration beyond Files app, you'd need a Dropbox Developer account and API app created. Again, for basic file picking via Files app, this might not be needed.
iCloud Drive (iOS Built-in): iCloud Drive integration primarily relies on the iCloud capability setup (point 6). No separate developer console setup is typically needed for basic Files app iCloud Drive access.
Key Takeaways & Recommendations:

Prioritize Essential Setup: Focus on setting up App Store Connect/StoreKit (if you want to monetize with subscriptions) and Firebase (for analytics and crash reporting as a baseline). These are generally crucial for most apps.
Optional Services - Decide Based on Needs: Carefully consider if you need ChatPDF API, Branch, Facebook SDK, and deeper Google Drive/Dropbox API integrations. These add complexity and might have costs associated with them. Only set up what's truly necessary for your app's initial functionality and marketing strategy.
Start Simple, Iterate: Begin with a minimal setup and add more services as your app evolves and your needs become clearer.
Test in Stages: After setting up each service, thoroughly test its integration in your app to ensure it's working correctly.
