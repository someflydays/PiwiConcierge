//
//  InteractiveProductCard.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct InteractiveProductCard: View {
    let index: Int

    var body: some View {
        VStack {
            Model3D(named: "recommended-model-\(index)", bundle: realityKitContentBundle)
                .gesture(
                    DragGesture(minimumDistance: 0).onChanged { value in
                        // Handle rotation and zoom gestures
                    }
                )
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)

            Text("Product \(index + 1)")
                .font(.headline)
                .foregroundColor(.primary)

            Text("$99.99")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 150)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
        .task {
            await preloadModel(named: "recommended-model-\(index)")
        }
    }

    func preloadModel(named name: String) async {
        do {
            let _ = try await Entity(named: name, in: realityKitContentBundle)
        } catch {
            print("Error preloading model: \(error)")
        }
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard(index: 0)
    }
}
