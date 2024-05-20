//
//  InteractiveProductCard.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/17/24.
//

import SwiftUI
import RealityKit

struct InteractiveProductCard: View {
    let index: Int
    @State private var isLiked = false

    var body: some View {
        VStack {
            Model3D(named: "recommended-model-\(index)", bundle: realityKitContentBundle)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(isLiked ? .red : .white)
                            .padding(5)
                    }
                    .background(Color.black.opacity(0.5))
                    .clipShape(Circle())
                    .padding([.top, .trailing], 10),
                    alignment: .topTrailing
                )

            Text("Recommended Item \(index + 1)")
                .font(.headline)
                .foregroundColor(.primary)

            Text("$99.99")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Button(action: {}) {
                Text("View Details")
                    .font(.caption)
                    .padding(5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.top, 5)
        }
        .frame(width: 150)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard(index: 0)
    }
}
