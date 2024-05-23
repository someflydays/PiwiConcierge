//
//  HomeView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var userData: UserData
    @State private var isDragging: Bool = false

    var body: some View {
        ZStack {
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
                                .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling

                                Button(action: { handleCreateCollection(product: product) }) {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.green)
                                }
                                .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling

                                Button(action: {
                                    handleSaveForLater(product: product)
                                }) {
                                    Image(systemName: product.isSaved ? "bookmark.fill" : "bookmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)
                                }
                                .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling
                            }
                            .padding(.top, 10)

                            Spacer()
                        }
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)

                        InteractiveProductCard(
                            product: product,
                            onSwipeLeft: { handleSwipeLeft(product: product) },
                            onSwipeRight: { handleSwipeRight(product: product) }
                        )
                        .frame(maxWidth: .infinity)
                        //.padding(.trailing, 20)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .transition(.opacity.animation(.easeInOut(duration: 1.0))) // Slower fade transition
                    }
                } else {
                    Text("No more recommendations")
                        .font(.title)
                        .foregroundColor(.secondary)
                        .padding()
                }

                Spacer()

                HStack {
                    // The Back Button only appears at the second recommendation, and beyond
                    if userData.currentIndex > 0 {
                        HStack {
                            Button(action: { userData.showPreviousProduct() }) {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray.opacity(0.5))
                                    .clipShape(Circle())
                            }
                            .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling
                            .padding(.leading, 20)
                            Spacer()
                        }
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isDragging.toggle()
                        }) {
                            Image(systemName: "cube")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding()
                                .foregroundColor(.white)
                        }
                        .gesture(isDragging ? DragGesture()
                            .onChanged { value in
                                // Update model position based on drag
                            }
                            .onEnded { _ in
                                isDragging = false
                            }
                                 : nil)
                        .padding()
                        .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling
                    }
                }
            }
            .padding()
        }
    }

    private func handleSwipeLeft(product: Product) {
        withAnimation {
            userData.showNextProduct()
        }
    }

    private func handleSwipeRight(product: Product) {
        withAnimation {
            userData.showPreviousProduct()
        }
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
