//
//  HomeView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import RealityKit

struct HomeView: View {
    @ObservedObject var userData: UserData
    @State private var currentProductIndex = 0 // Track the current product index

    var body: some View {
        VStack {
            Spacer()
            // Header with personalized greeting
            HeaderView(userName: userData.userName)
                .padding(.horizontal)

            // Display one product at a time
            if userData.recommendedProducts.indices.contains(currentProductIndex) {
                InteractiveProductCard(
                    product: userData.recommendedProducts[currentProductIndex],
                    onSwipeLeft: handleSwipeLeft,
                    onSwipeRight: handleSwipeRight,
                    onAddToCart: handleAddToCart,
                    onCreateCollection: handleCreateCollection
                )
                .padding(.horizontal)
            } else {
                Text("No more recommendations")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }

    private func handleSwipeLeft() {
        // Logic for disliking a product
        currentProductIndex += 1
    }

    private func handleSwipeRight() {
        // Logic for liking a product
        currentProductIndex += 1
    }

    private func handleAddToCart() {
        // Logic for adding a product to the cart
    }

    private func handleCreateCollection() {
        // Logic for creating a collection with complementary products
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userData: UserData())
    }
}
