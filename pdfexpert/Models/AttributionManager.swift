//
//  AttributionManager.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 04/09/23.
//

import Foundation
import UIKit
import AppTrackingTransparency

protocol AttributionManager : AnyObject {
    func onAppDidFinishLaunching(withLaunchOptions launchOptions:  [UIApplication.LaunchOptionsKey: Any]?)
    func onOpenUrl(url: URL)
    func onHandleATTAuthorizationStatus(authorizationStatus: ATTrackingManager.AuthorizationStatus)
}
