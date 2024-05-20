//
//  PromotionsSection.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct PromotionsSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Promotions")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        PromotionCard(index: index)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PromotionsSection_Previews: PreviewProvider {
    static var previews: some View {
        PromotionsSection()
    }
}
