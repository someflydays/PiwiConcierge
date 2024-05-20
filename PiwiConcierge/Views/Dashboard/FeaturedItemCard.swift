//
//  FeaturedItemCard.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import RealityKit

struct FeaturedItemCard: View {
    let index: Int

    var body: some View {
        VStack {
            Model3D(named: "placeholder-model-\(index)", bundle: realityKitContentBundle)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)

            Text("Featured Item \(index + 1)")
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
    }
}

struct FeaturedItemCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemCard(index: 0)
    }
}
