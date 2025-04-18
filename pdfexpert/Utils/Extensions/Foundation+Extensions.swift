//
//  Foundation+Extensions.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 03/05/23.
//

import Foundation

extension URL {
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
