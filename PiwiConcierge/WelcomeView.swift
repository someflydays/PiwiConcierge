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
        VStack(spacing: 20) {
            Spacer()

            ZStack {
                // Icon background image
                Image("icon-background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                
                // Lottie animation (Shopping cart)
                LottieView(filename: "shopping-cart-animation")
                    .frame(height: 150)
            }

            Text("Welcome to Piwi Concierge")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                .shadow(radius: 2)
            

            Text("Discover personalized product recommendations and enjoy an immersive shopping experience.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)

            Button(action: {
                withAnimation {
                    showDashboard.toggle()
                }
            }) {
                Text("Start")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: 150)
                    .background(
                        Color.blue.opacity(0.8)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(100)
                    .shadow(radius: 5)
            }
            .buttonStyle(PlainButtonStyle()) // Apply a plain button style to remove default styling
            .padding(.top, 20)
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(radius: 10)
        )
        .padding(.horizontal)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.4), Color.blue.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct LottieView: UIViewRepresentable {
    var filename: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        // Access the JSON file from the main bundle
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else {
            print("Animation file not found")
            return view
        }

        let animation = LottieAnimation.filepath(path)
        let animationView = LottieAnimationView(animation: animation)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()

        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(showDashboard: .constant(false))
    }
}
