//
//  GroupedRecommendations.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct GroupedRecommendations: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for You")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        InteractiveProductCard(
                            product: Product(name: "Product \(index + 1)", description: "This is a brief description of Product \(index + 1).", price: 99.99, modelName: "Placeholder-model-\(index)")
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct GroupedRecommendations_Previews: PreviewProvider {
    static var previews: some View {
        GroupedRecommendations()
    }
}
