//
//  RecommendationCarousel.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct RecommendationCarousel: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for You")
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
                            onCreateCollection: { handleCreateCollection(product: product) },
                            onSaveForLater: { handleSaveForLater(product: product) }
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
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

    private func handleSaveForLater(product: Product) {
        // Logic for saving a product for later
    }
}

struct RecommendationCarousel_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationCarousel(userData: UserData())
    }
}
