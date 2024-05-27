//
//  Product.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/21/24.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let modelName: String
    var isSaved: Bool = false
}
