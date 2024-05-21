//
//  ProductDetailView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import RealityKit

struct ProductDetailView: View {
    let productIndex: Int

    var body: some View {
        VStack {
            Model3D(named: "Placeholder-model-\(productIndex)", bundle: realityKitContentBundle)
                .frame(height: 400)
                .cornerRadius(15)
                .shadow(radius: 5)

            Text("Product Name \(productIndex + 1)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("$99.99")
                .font(.title)
                .foregroundColor(.secondary)
                .padding(.top, 5)

            Text("Product description goes here. This should provide more details about the product, its features, and benefits.")
                .font(.body)
                .padding()
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productIndex: 0)
    }
}
