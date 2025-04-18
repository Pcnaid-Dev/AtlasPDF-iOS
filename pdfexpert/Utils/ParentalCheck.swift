//
//  ParentalCheck.swift
//  StoryKidsAI
//
//  Created by Pcnaid Inc on 14/03/23.
//

import Foundation

enum ParentalCheck<T: Hashable>: Hashable, Identifiable {
    case checking(T)
    case success(T)
    
    var id: Self { self }
}
