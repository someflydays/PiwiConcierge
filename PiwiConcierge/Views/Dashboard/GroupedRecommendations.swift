//
//  GroupedRecommendations.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct GroupedRecommendations: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Complete Your Look")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) { // Increased spacing
                    ForEach(0..<3) { index in
                        InteractiveProductCard(index: index + 3) // Assuming different indices for different products
                            .frame(width: 250, height: 400) // Increased size
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct GroupedRecommendations_Previews: PreviewProvider {
    static var previews: some View {
        GroupedRecommendations()
    }
}
