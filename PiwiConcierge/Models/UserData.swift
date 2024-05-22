//
//  UserData.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import Foundation

class UserData: ObservableObject {
    @Published var userName: String = "Derek"
    @Published var recommendedProducts: [Product] = [
        Product(name: "Product 1", description: "This is a brief description of Product 1.", price: 99.99, modelName: "Placeholder-model-0"),
        Product(name: "Product 2", description: "This is a brief description of Product 2.", price: 149.99, modelName: "Placeholder-model-1"),
        Product(name: "Product 3", description: "This is a brief description of Product 3.", price: 199.99, modelName: "Placeholder-model-2")
    ]
}
