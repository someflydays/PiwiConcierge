//
//  HomeView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack(spacing: 20) {
            if let product = userData.recommendedProducts.first {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)

                        Text(product.description)
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)

                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding(.top, 10)

                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    InteractiveProductCard(
                        product: product,
                        onSwipeLeft: { handleSwipeLeft(product: product) },
                        onSwipeRight: { handleSwipeRight(product: product) },
                        onAddToCart: { handleAddToCart(product: product) },
                        onCreateCollection: { handleCreateCollection(product: product) },
                        onSaveForLater: { handleSaveForLater(product: product) }
                    )
                    .frame(width: 300, height: 450)
                    .padding(.trailing, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            } else {
                Text("No more recommendations")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .padding()
            }

            Spacer()
        }
        .padding()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userData: UserData())
    }
}
