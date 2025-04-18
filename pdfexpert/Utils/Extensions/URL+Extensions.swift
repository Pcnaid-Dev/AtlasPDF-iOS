//
//  URL+Extensions.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 28/07/23.
//

import Foundation

extension URL {
    var filename: String {
        self.deletingPathExtension().lastPathComponent
    }
}
