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
                    Image(systemName: "cube")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .clipShape(Circle())
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
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard(
            product: Product(name: "Sample Product", description: "This is a brief description of the product.", price: 99.99, modelName: "Placeholder-model-0"),
            onSwipeLeft: {},
            onSwipeRight: {},
            onAddToCart: {},
            onCreateCollection: {},
            onSaveForLater: {}
        )
    }
}
