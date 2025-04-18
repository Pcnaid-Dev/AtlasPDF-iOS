//
//  SceneDelegate.swift
//  pdfexpert
//
//  Created by AbdulBadran on 4/16/25.
//

import UIKit
import SwiftUI // Import SwiftUI if ColorPalette/FontPalette are defined there or rely on it

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.

        // Setup global appearance just before the scene's window appears
        self.setupAppearance()

        // If using SwiftUI App lifecycle (@main struct ... : App),
        // the system handles window creation and root view controller setup.
        // No manual window setup needed here if PdfExpertApp.swift has WindowGroup.

        guard let _ = (scene as? UIWindowScene) else { return }

        // Example if you needed to inject environment objects into ContentView
        // (assuming ContentView is your root view from PdfExpertApp)
        // if let windowScene = scene as? UIWindowScene {
        //     let window = UIWindow(windowScene: windowScene)
        //     let contentView = ContentView().environmentObject(YourObservableObject()) // Example
        //     window.rootViewController = UIHostingController(rootView: contentView)
        //     self.window = window
        //     window.makeKeyAndVisible()
        // }

        // If your PdfExpertApp.swift correctly defines the WindowGroup with ContentView,
        // the standard template code above is often sufficient, and SwiftUI handles the rest.
    }

    private func setupAppearance() {
        // Copied from AppDelegate
        UINavigationBar.appearance().isTranslucent = false
        // Make sure ColorPalette and FontPalette are accessible here
        // You might need to ensure they are defined globally or imported correctly
        // If they are SwiftUI types (e.g., Color, Font), use them directly.
        // If they return UIColors/UIFonts, the existing code is fine.

        // Assuming ColorPalette.primaryText returns a type initializable by UIColor
        // and FontPalette.uiFontMedium returns a UIFont
        // If not, adjust the initializers accordingly.
        UINavigationBar.appearance().tintColor = UIColor(ColorPalette.primaryText) // Example if using Asset Catalog Color
        // Or if ColorPalette.primaryText IS a UIColor:
        // UINavigationBar.appearance().tintColor = ColorPalette.primaryText

        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 24, weight: .medium)] // Example using system font
        // Or if FontPalette.uiFontMedium returns a UIFont:
        // UINavigationBar.appearance().largeTitleTextAttributes = [.font : FontPalette.uiFontMedium(withSize: 24)]

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        // Similar adjustments might be needed for ColorPalette usage:
        tabBarAppearance.backgroundColor = UIColor(ColorPalette.secondaryBG) // Example
        tabBarAppearance.selectionIndicatorTintColor = UIColor(ColorPalette.buttonGradientStart) // Example

        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
