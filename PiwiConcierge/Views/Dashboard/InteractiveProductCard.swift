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
    let index: Int

    var body: some View {
        NavigationLink(destination: ProductDetailView(productIndex: index)) {
            VStack {
                Model3D(named: "Placeholder-model-\(index)", bundle: realityKitContentBundle)
                    .frame(height: 250) // Adjusted height
                    .cornerRadius(15)
                    .shadow(radius: 5)

                Text("Product Name \(index + 1)")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.top, 5)

                Text("$99.99")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(15)
            .shadow(radius: 5)
            .frame(width: 250, height: 400) // Ensure consistent size
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard(index: 0)
    }
}
