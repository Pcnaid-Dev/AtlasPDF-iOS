//
//  StoreKit+Extensions.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 05/09/23.
//

import Foundation
import StoreKit

public extension Product {
    var isFreeTrial: Bool {
        self.subscription?.introductoryOffer?.paymentMode == .freeTrial
    }
}
