//
//  InteractiveProductCard.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI

struct InteractiveProductCard: View {
    @State private var isLiked = false

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
                .padding(.bottom, 5)
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

            Text("Product Name")
                .font(.caption)
                .fontWeight(.semibold)

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
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5)
        )
    }
}

struct InteractiveProductCard_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProductCard()
    }
}
