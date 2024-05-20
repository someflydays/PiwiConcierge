//
//  CategoryNavigation.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct CategoryNavigation: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Browse Categories")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<4) { index in
                        CategoryCard(index: index)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CategoryNavigation_Previews: PreviewProvider {
    static var previews: some View {
        CategoryNavigation()
    }
}
