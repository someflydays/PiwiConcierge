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
            if let product = userData.currentProduct {
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

                        HStack(spacing: 30) {
                            Button(action: { handleAddToCart(product: product) }) {
                                Image(systemName: "cart.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.blue)
                            }

                            Button(action: { handleCreateCollection(product: product) }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.green)
                            }

                            Button(action: {
                                handleSaveForLater(product: product)
                            }) {
                                Image(systemName: product.isSaved ? "bookmark.fill" : "bookmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.top, 10)

                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    InteractiveProductCard(
                        product: product,
                        onSwipeLeft: { userData.showNextProduct() },
                        onSwipeRight: { userData.showPreviousProduct() },
                        onAddToCart: { handleAddToCart(product: product) },
                        onCreateCollection: { handleCreateCollection(product: product) },
                        onSaveForLater: { handleSaveForLater(product: product) }
                    )
                    .frame(maxWidth: .infinity)
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

            if userData.currentIndex > 0 {
                HStack {
                    Button(action: { userData.showPreviousProduct() }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding()
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            }
        }
        .padding()
    }

    private func handleSwipeLeft(product: Product) {
        userData.showNextProduct()
    }

    private func handleSwipeRight(product: Product) {
        userData.showPreviousProduct()
    }

    private func handleAddToCart(product: Product) {
        // Logic for adding a product to the cart
    }

    private func handleCreateCollection(product: Product) {
        // Logic for creating a collection with complementary products
    }

    private func handleSaveForLater(product: Product) {
        userData.toggleSave(for: product)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userData: UserData())
    }
}
