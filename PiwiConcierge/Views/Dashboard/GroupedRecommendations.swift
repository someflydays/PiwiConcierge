//
//  GroupedRecommendations.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct GroupedRecommendations: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Complete Your Look")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(userData.recommendedProducts) { product in
                        InteractiveProductCard(
                            product: product,
                            onSwipeLeft: { handleSwipeLeft(product: product) },
                            onSwipeRight: { handleSwipeRight(product: product) },
                            onAddToCart: { handleAddToCart(product: product) },
                            onCreateCollection: { handleCreateCollection(product: product) }
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private func handleSwipeLeft(product: Product) {
        // Logic for disliking a product
    }

    private func handleSwipeRight(product: Product) {
        // Logic for liking a product
    }

    private func handleAddToCart(product: Product) {
        // Logic for adding a product to the cart
    }

    private func handleCreateCollection(product: Product) {
        // Logic for creating a collection with complementary products
    }
}

struct GroupedRecommendations_Previews: PreviewProvider {
    static var previews: some View {
        GroupedRecommendations(userData: UserData())
    }
}
