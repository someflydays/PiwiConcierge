//
//  WelcomeView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI
import Lottie

struct WelcomeView: View {
    @Binding var showDashboard: Bool

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                // Icon background image
                Image("icon-background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                
                // Lottie animation (Shopping cart)
                LottieView(filename: "shopping-cart-animation")
                    .frame(height: 100)
            }
            .padding(.top, 50) // Padding above the icon
            
            Text("Welcome to Piwi Concierge.")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            Text("Discover personalized product recommendations and enjoy an immersive shopping experience.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: {
                showDashboard.toggle()
            }) {
                Text("Enter Immersive Shopping")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemBackground))
                .shadow(radius: 10)
        )
        .padding(.horizontal)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(showDashboard: .constant(false))
    }
}
