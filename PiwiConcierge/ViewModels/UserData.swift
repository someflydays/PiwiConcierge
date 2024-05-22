//
//  UserData.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import Foundation
import Combine

class UserData: ObservableObject {
    @Published var userName: String = "Derek" // Default value, replace with actual user name logic
    @Published var recommendedProducts: [Product] = [
        Product(name: "Product 1", description: "This is a brief description of Product 1.", price: 99.99, modelName: "Placeholder-model-0"),
        Product(name: "Product 2", description: "This is a brief description of Product 2.", price: 89.99, modelName: "Placeholder-model-1"),
        Product(name: "Product 3", description: "This is a brief description of Product 3.", price: 79.99, modelName: "Placeholder-model-2")
    ]
    
    @Published var currentIndex: Int = 0

    var currentProduct: Product? {
        if currentIndex >= 0 && currentIndex < recommendedProducts.count {
            return recommendedProducts[currentIndex]
        }
        return nil
    }

    func showNextProduct() {
        if currentIndex < recommendedProducts.count - 1 {
            currentIndex += 1
        }
    }

    func showPreviousProduct() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    func toggleSave(for product: Product) {
        if let index = recommendedProducts.firstIndex(where: { $0.id == product.id }) {
            recommendedProducts[index].isSaved.toggle()
        }
    }
}
