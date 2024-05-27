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
        VStack(spacing: 20) {            
            /*
            Button(action: { userData.showNextProduct() }) {
                ZStack {
                    Image("icon-background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                    
                    LottieView(filename: "shopping-cart-animation")
                        .frame(height: 60)
                }
            }
            .padding(.top, 20) // This pads the Button to the top
            .buttonStyle(PlainButtonStyle())
             */
            
            /*
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
            }
            .padding(.top, 10)
            //.buttonStyle(PlainButtonStyle())
            */
            
            if let product = userData.currentProduct {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 20) // This pads the Product title to the top

                        Text(product.description)
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 10)

                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding(.top, 10)
                        
                        Button(action: {
                            handleSaveForLater(product: product)
                        }) {
                            Image(systemName: product.isSaved ? "bookmark.fill" : "bookmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        /*
                        Button(action: { handleAddToCart(product: product) }) {
                            Image(systemName: "cart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(PlainButtonStyle())
                        */
                        
                        Button(action: { handleAddToCart(product: product) }) {
                            Text("Add to Cart")
                                .padding()
                                .frame(maxWidth: 150)
                                .foregroundColor(.white)
                        }
                        .background(
                            Color.blue
                        )
                        .cornerRadius(100)
                        .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling
                        //.padding(.top, 20)

                        /*
                        Button(action: { handleCreateCollection(product: product) }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                        }
                        .buttonStyle(PlainButtonStyle())
                        */
                        
                        Button(action: { handleCreateCollection(product: product) }) {
                            Text("New Group")
                                .padding()
                                .frame(maxWidth: 150)
                                .foregroundColor(.white)
                        }
                        .background(
                            Color.green
                        )
                        .cornerRadius(100)
                        .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling
                        .padding(.top, 10)

                        Spacer()
                    }
                    .padding(.leading, 20) // This pads the entire VStack to the left
                    .frame(maxWidth: .infinity, alignment: .leading)


                    InteractiveProductCard(
                        product: product
                    )
                    .padding(.leading, 250) // These three center the product in the right side of the window
                    .padding(.trailing, 250)
                    .padding(.top, 60)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .transition(.opacity.animation(.easeInOut(duration: 0.5))) // Slower fade transition
                }
            } else {
                Text("No more recommendations")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .padding()
            }

            //Spacer() // This adds a bit of space between the upper HStack and the lower HStack

            HStack {
                // The Back Button only appears at the second recommendation, and beyond
                if userData.currentIndex > 0 {
                    Button(action: { userData.showPreviousProduct() }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .padding() // For some reason, this makes the circle around the button bigger
                            .foregroundColor(.white)
                            //.background(Color.gray.opacity(0.5))
                            //.clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading, 5) // This pads the Back button to the left
                }
                Spacer() // This spacer places the Cube button to the right (instead of the center)
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
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 20) // This pads the Cube button to the right
            }
        }
        .padding() // This keeps the product title and info from being too close to the top of the screen
        .gesture(
            TapGesture(count: 3)
                .onEnded {
                    userData.showNextProduct()
                }
        )
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
