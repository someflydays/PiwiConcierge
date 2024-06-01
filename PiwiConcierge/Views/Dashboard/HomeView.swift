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
    @State private var searchText: String = ""

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
                            .frame(width: 20, height: 20)
                            .padding() // This makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    .buttonBorderShape(.circle)
                    //.buttonStyle(PlainButtonStyle())
                    .padding(.leading, 20)
                    
                    // "Forward" button (should only appear if the user goes back)
                    Button(action: { userData.showNextProduct() }) {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding() // This makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    .buttonBorderShape(.circle)
                    //.buttonStyle(PlainButtonStyle())
                    
                    Spacer() ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
                    SearchBar(text: $searchText)
                        .frame(width: 500) // Adjust width of Search Bar
                        //.padding(.horizontal)
                        //.cornerRadius(20)
                        .shadow(radius: 5)
                    
                    Spacer() ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
                    // "Save" button
                    Button(action: {
                        handleSaveForLater(product: product)
                    }) {
                        Image(systemName: product.isSaved ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding() // This makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    .buttonBorderShape(.circle)
                    //.buttonStyle(PlainButtonStyle())
                    
                    // "Share" button
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding() // This makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    .buttonBorderShape(.circle)
                    //.buttonStyle(PlainButtonStyle())
                    
                    // "More Info" button
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding() // This makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    .buttonBorderShape(.circle)
                    //.buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 20)
                    
                    //  END OF HSTACK (First row)
                    
                }
                //.padding(.top, 20)
                
                // Second row
                HStack {
                    
                    // First column (Product info, "Buy Now" button, "Add to Cart" button)
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
                        
                        // "Buy Now" button
                        Button(action: { handleAddToCart(product: product) }) {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Buy Now")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: 265, maxHeight: 75)
                        .background(
                            Color.black
                        )
                        .cornerRadius(100)
                        .buttonStyle(PlainButtonStyle())
                        
                        // "Add to Cart" button
                        Button(action: { handleAddToCart(product: product) }) {
                            Text("Add to Cart")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: 265, maxHeight: 75)
                                .foregroundColor(.white)
                        }
                        .background(
                            Color.blue
                        )
                        .cornerRadius(100)
                        .buttonStyle(PlainButtonStyle())
                        
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
                
                // Third row ("New Group" button, "Cube" button)
                
                HStack {
                    
                    // "New Group" button
                    Button(action: { handleCreateCollection(product: product) }) {
                        Text("New Group")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: 225, maxHeight: 75)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20) // This pads the "New Group" button to the left
                    /*
                    .background(
                        Color.green
                    )
                    */
                    //.cornerRadius(100)
                    //.buttonStyle(PlainButtonStyle())
                    
                    Spacer() ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
                    // "Cube" button
                    Button(action: {
                        isDragging.toggle()
                    }) {
                        Image(systemName: "cube")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding() // This makes the circle around the button bigger
                            .foregroundColor(.white)
                    }
                    //.buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 20) // This pads the "Cube" button to the right
                    .padding(.top, 20) // Even though "Cube" is in same HStack as "New Group", "Cube" is lower
                    .buttonBorderShape(.circle)
                    /*.onDrag({
                        return NSItemProvider(contentsOf: product.modelURL) ?? NSItemProvider()
                    })*/
                    
                }
                .padding(.bottom, 20)
                
            }
        } else {
            Text("No more recommendations")
                .font(.title)
                .foregroundColor(.secondary)
                .padding()
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
