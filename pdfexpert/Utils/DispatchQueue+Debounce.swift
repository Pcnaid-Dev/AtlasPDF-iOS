//
//  DispatchQueue+Debounce.swift
//  pdfexpert
//
//  Created by AbdulBadran on 4/18/25.
//

import Foundation

extension DispatchQueue {
    /// Run action on the main thread once after delay,
    /// cancelling any previous call that used the same id.
    static func mainDebounced(id: String = #function,
                              delay: TimeInterval = 0.12,
                              _ action: @escaping () -> Void) {
        struct Holder { static var tasks = [String: DispatchWorkItem]() }

        Holder.tasks[id]?.cancel()
        let work = DispatchWorkItem(block: action)
        Holder.tasks[id] = work
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: work)
    }
}
