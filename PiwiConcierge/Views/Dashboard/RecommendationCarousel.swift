//
//  RecommendationCarousel.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct RecommendationCarousel: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for You")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        InteractiveProductCard(index: index)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecommendationCarousel_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationCarousel()
    }
}
