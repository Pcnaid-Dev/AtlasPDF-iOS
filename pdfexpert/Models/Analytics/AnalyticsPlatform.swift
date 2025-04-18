//
//  AnalyticsPlatform.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 04/04/23.
//

import Foundation

protocol AnalyticsPlatform {
    func track(event: AnalyticsEvent)
}
