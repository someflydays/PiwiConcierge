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

    @State private var modelScale: CGFloat = 1.0
    @State private var modelRotation: Angle = .zero

    var body: some View {
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
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard(
            product: Product(name: "Sample Product", description: "This is a brief description of the product.", price: 99.99, modelName: "Placeholder-model-0"),
            onSwipeLeft: {},
            onSwipeRight: {}
        )
    }
}
