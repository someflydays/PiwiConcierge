//
//  PromotionCard.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import RealityKit

struct PromotionCard: View {
    let index: Int

    var body: some View {
        VStack {
            Image("promotion-\(index)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)

            Text("Promotion \(index + 1)")
                .font(.headline)
                .foregroundColor(.primary)

            Text("Save 20%")
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

struct PromotionCard_Previews: PreviewProvider {
    static var previews: some View {
        PromotionCard(index: 0)
    }
}
