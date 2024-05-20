//
//  RecommendationCarousel.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct RecommendationCarousel: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for You")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) { // Increased spacing
                    ForEach(0..<3) { index in
                        InteractiveProductCard(index: index)
                            .frame(width: 250, height: 400) // Increased size
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct RecommendationCarousel_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationCarousel()
    }
}
