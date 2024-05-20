//
//  CartView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        VStack {
            Text("Cart")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Your cart is currently empty.")
                .font(.headline)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
