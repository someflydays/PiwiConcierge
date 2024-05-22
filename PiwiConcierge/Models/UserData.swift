//
//  UserData.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import Foundation
import Combine

class UserData: ObservableObject {
    @Published var userName: String = "Derek"
    @Published var recommendedProducts: [Product] = [
        Product(name: "Product 1", price: 99.99, modelName: "Placeholder-model-0"),
        Product(name: "Product 2", price: 149.99, modelName: "Placeholder-model-1"),
        Product(name: "Product 3", price: 199.99, modelName: "Placeholder-model-2")
    ]
}
