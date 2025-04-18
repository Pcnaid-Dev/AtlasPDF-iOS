//
//  ConfigService.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 13/04/23.
//

import Foundation
import Combine

protocol ConfigService {
    func onApplicationDidBecomeActive()
    var remoteConfigData: CurrentValueSubject<RemoteConfigData, Never> { get }
}
