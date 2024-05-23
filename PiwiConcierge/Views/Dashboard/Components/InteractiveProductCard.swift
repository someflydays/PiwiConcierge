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

    @State private var modelScale: CGFloat = 1.0
    @State private var modelRotationY: Angle = .zero
    @State private var modelPosition: CGSize = .zero
    @State private var rotationVelocity: CGFloat = 0.0
    @State private var lastDragValue: DragGesture.Value?
    @State private var isPinching: Bool = false

    private let maxRotationSpeed: CGFloat = 5.0 // Maximum rotation speed in degrees per update
    private let decelerationRate: CGFloat = 0.99 // Deceleration rate for inertia effect
    private let velocityThreshold: CGFloat = 0.1 // Threshold to apply inertia

    var body: some View {
        Model3D(named: product.modelName, bundle: realityKitContentBundle)
            .frame(height: 300 * modelScale) // Adjust height based on scale
            .rotation3DEffect(modelRotationY, axis: (x: 0, y: 1, z: 0)) // Apply y-axis rotation
            .offset(x: modelPosition.width, y: modelPosition.height) // Apply position offset
            .cornerRadius(15)
            .shadow(radius: 5)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if let lastValue = lastDragValue {
                            let translation = value.translation.width - lastValue.translation.width
                            rotationVelocity = translation / 10
                            // Clamp the rotation velocity to the maximum speed
                            rotationVelocity = min(max(rotationVelocity, -maxRotationSpeed), maxRotationSpeed)
                        }
                        lastDragValue = value

                        let rotationAngleY = Angle(degrees: Double(rotationVelocity))
                        modelRotationY += rotationAngleY
                    }
                    .onEnded { _ in
                        if abs(rotationVelocity) > velocityThreshold {
                            applyInertia()
                        }
                        lastDragValue = nil
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .onChanged { value in
                        isPinching = true
                        modelScale = value
                    }
                    .onEnded { _ in
                        isPinching = false
                    }
            )
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    .onChanged { value in
                        switch value {
                        case .second(true, let drag?):
                            modelPosition = CGSize(
                                width: modelPosition.width + drag.translation.width,
                                height: modelPosition.height + drag.translation.height
                            )
                        default:
                            break
                        }
                    }
            )
            .gesture(
                TapGesture()
                    .onEnded {
                        // Trigger animation for the product
                        playProductAnimation(for: product)
                    }
            )
    }

    private func applyInertia() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            rotationVelocity *= decelerationRate
            let rotationAngleY = Angle(degrees: Double(rotationVelocity))
            modelRotationY += rotationAngleY

            if abs(rotationVelocity) < velocityThreshold {
                timer.invalidate()
                rotationVelocity = 0.0
            }
        }
    }

    private func playProductAnimation(for product: Product) {
        // Implement the animation logic here
        // Example: Trigger an animation like propeller spin for a model airplane
        // This is just a placeholder for the actual animation implementation
        print("Playing animation for \(product.name)")
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard(
            product: Product(name: "Sample Product", description: "This is a brief description of the product.", price: 99.99, modelName: "Placeholder-model-0")
        )
    }
}
