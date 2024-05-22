//
//  InteractiveProductCard.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct InteractiveProductCard: View {
    let product: Product
    let onSwipeLeft: () -> Void
    let onSwipeRight: () -> Void
    let onAddToCart: () -> Void
    let onCreateCollection: () -> Void
    let onSaveForLater: () -> Void

    @State private var isSaved: Bool = false // Track saved state
    @State private var modelScale: CGFloat = 1.0
    @State private var modelRotation: Angle = .zero
    @State private var isDragging: Bool = false

    var body: some View {
        VStack {
            ZStack {
                Model3D(named: product.modelName, bundle: realityKitContentBundle)
                    .frame(height: 300 * modelScale) // Adjust height based on scale
                    .rotationEffect(modelRotation) // Apply rotation
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .gesture(DragGesture()
                        .onEnded { value in
                            if value.translation.width < -100 {
                                withAnimation {
                                    onSwipeLeft()
                                }
                            } else if value.translation.width > 100 {
                                withAnimation {
                                    onSwipeRight()
                                }
                            }
                        }
                    )
                    .gesture(MagnificationGesture()
                        .onChanged { value in
                            modelScale = value
                        }
                    )
                    .gesture(RotationGesture()
                        .onChanged { value in
                            modelRotation = value
                        }
                    )

                // Repositioning button
                Button(action: {
                    isDragging.toggle()
                }) {
                    Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .gesture(isDragging ? DragGesture()
                    .onChanged { value in
                        // Update model position based on drag
                    }
                    .onEnded { _ in
                        isDragging = false
                    }
                : nil)
                .offset(x: 100, y: 100) // Adjust position relative to the model
            }

            Text(product.name)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 5)

            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                Button(action: onAddToCart) {
                    Text("Add to Cart")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: onCreateCollection) {
                    Text("Create Collection")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    isSaved.toggle()
                    onSaveForLater()
                }) {
                    Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width: 300, height: 450)
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard(
            product: Product(name: "Sample Product", price: 99.99, modelName: "Placeholder-model-0"),
            onSwipeLeft: {},
            onSwipeRight: {},
            onAddToCart: {},
            onCreateCollection: {},
            onSaveForLater: {}
        )
    }
}
