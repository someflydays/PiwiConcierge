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
    @State private var previousProductIndices: [Int] = [] // Track previously seen product indices

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
                    onCreateCollection: handleCreateCollection,
                    onSaveForLater: handleSaveForLater
                )
                .padding(.horizontal)
            } else {
                Text("No more recommendations")
                    .font(.title)
                    .foregroundColor(.secondary)
            }

            HStack {
                if !previousProductIndices.isEmpty {
                    Button(action: handleBack) {
                        Text("Back")
                            .font(.headline)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }

            Spacer()
        }
        .padding()
    }

    private func handleSwipeLeft() {
        // Logic for disliking a product
        previousProductIndices.append(currentProductIndex)
        currentProductIndex += 1
    }

    private func handleSwipeRight() {
        // Logic for liking a product
        previousProductIndices.append(currentProductIndex)
        currentProductIndex += 1
    }

    private func handleBack() {
        if let lastIndex = previousProductIndices.popLast() {
            currentProductIndex = lastIndex
        }
    }

    private func handleAddToCart() {
        // Logic for adding a product to the cart
    }

    private func handleCreateCollection() {
        // Logic for creating a collection with complementary products
    }

    private func handleSaveForLater() {
        // Logic for saving a product for later
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userData: UserData())
    }
}
