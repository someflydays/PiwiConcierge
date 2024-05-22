//
//  Product.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/21/24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var modelName: String
}
