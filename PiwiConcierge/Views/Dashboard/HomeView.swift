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
        if let product = userData.currentProduct {
            
            // Main VStack
            VStack {
                
                // First row ("Back" button, "Forward" button, "Save" button, "Share" button, "More Info" button)
                HStack {
                    
                    // "Back" button (only appears at the second recommendation, and beyond)
                    Button(action: { userData.showPreviousProduct() }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            //.padding() // For some reason, this makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    //.buttonStyle(PlainButtonStyle())
                    .padding(.leading, 20)
                    
                    // "Forward" button (should only appear if the user goes back)
                    Button(action: { userData.showNextProduct() }) {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            //.padding() // For some reason, this makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    //.buttonStyle(PlainButtonStyle())
                    
                    Spacer() ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
                    // "Save" button
                    Button(action: {
                        handleSaveForLater(product: product)
                    }) {
                        Image(systemName: product.isSaved ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    //.buttonStyle(PlainButtonStyle())
                    
                    // "Share" button
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    //.buttonStyle(PlainButtonStyle())
                    
                    // "More Info" button
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    //.buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 20)
                    
                    //  END OF HSTACK (First row)
                    
                }
                .padding(.top, 20)
                
                // Second row
                HStack {
                    
                    // First column (Product info, "Add to Cart" button, "New Group" button)
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Product name
                        Text(product.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 20)
                        
                        // Product description
                        Text(product.description)
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 10)
                        
                        // Price
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding(.top, 10)
                        
                        Spacer() ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        
                        // "Add to Cart" button
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
                        .buttonStyle(PlainButtonStyle())
                        
                        // "New Group" button
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
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 10)
                        
                        //  END OF VSTACK (First column in second row)
                        
                    }
                    .padding(.leading, 20) // This pads the VStack to the left
                    
                    // Second column (3D object)
                    InteractiveProductCard(
                        product: product
                    )
                    //.padding(.leading, 100) // Adjust the positioning of the 3D object within the second column
                    .padding(.trailing, 100)
                    //.padding(.top, 60)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .transition(.opacity.animation(.easeInOut(duration: 0.5))) // Slower fade transition (from one product to the next)
                    
                }
                
                // Third row ("Cube" button)
                
                HStack {
                    
                    Spacer() ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
                    // "Cube" button
                    Button(action: {
                        isDragging.toggle()
                    }) {
                        Image(systemName: "cube")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            //.padding()
                            .foregroundColor(.white)
                    }
                    //.buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 20) // This pads the Cube button to the right
                    
                }
                .padding(.bottom, 20)
                
            }
            
            // This gesture applies to the main VStack
            .gesture(
                TapGesture(count: 3)
                    .onEnded {
                        userData.showNextProduct()
                    }
            )
            
        } else {
            Text("No more recommendations")
                .font(.title)
                .foregroundColor(.secondary)
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
