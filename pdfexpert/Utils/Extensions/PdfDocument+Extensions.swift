//
//  PdfDocument+Extensions.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 24/08/23.
//

import Foundation
import PDFKit

// 1. Wrapper Struct: *This struct* behaves like a Collection of PDFPages
public struct PDFPagesView: Collection {
    private let document: PDFDocument // Holds the document

    init(document: PDFDocument) { // Needs the document to work
        self.document = document
    }

    // Type Aliases: Matches original
    public typealias Index = Int
    public typealias Element = PDFPage

    // Required Properties: Matches original logic
    public var startIndex: Index { return 0 }
    public var endIndex: Index { return self.document.pageCount } // Accesses page count via stored document

    // Required Subscript: Matches original logic (safer unwrap)
    public subscript(index: Index) -> Element {
        // Calls page(at:) on the stored document. Uses guard for safety.
        guard let page = self.document.page(at: index) else {
            fatalError("Index \(index) out of bounds...") // Or handle error differently
        }
        return page
    }

    // Required Method: Matches original
    public func index(after i: Index) -> Index {
        return i + 1
    }

    // Optional but good additions (often get default implementations from Collection anyway)
    public var count: Int { return self.document.pageCount }
    public var isEmpty: Bool { return self.document.pageCount == 0 }

    // Implicitly Gains: All other Collection/Sequence methods
    // (e.g., for-in loops, .count, .isEmpty, .map, .filter, .first, .last, etc.)
    // These methods operate *on the PDFPagesView instance*.
}

// 2. Accessor Extension: How to *get* the wrapper from a PDFDocument
extension PDFDocument {
    public var pages: PDFPagesView {
        return PDFPagesView(document: self)
    }
}


