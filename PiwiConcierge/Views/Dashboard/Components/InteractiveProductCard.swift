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
    @State private var rotationVelocity: Double = 0.0
    @State private var lastRotationTime: Date?

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
                        let currentTime = Date()
                        if let lastTime = lastRotationTime {
                            let timeInterval = currentTime.timeIntervalSince(lastTime)
                            rotationVelocity = Double(value.translation.width) / timeInterval
                        }
                        lastRotationTime = currentTime
                        
                        let rotationAngleY = Angle(degrees: value.translation.width / 10)
                        modelRotationY += rotationAngleY
                    }
                    .onEnded { _ in
                        applyInertia()
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .onChanged { value in
                        modelScale = value
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
        withAnimation(.easeOut(duration: 2.0)) {
            modelRotationY += Angle(degrees: rotationVelocity / 10)
        }
        rotationVelocity = 0.0
        lastRotationTime = nil
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
