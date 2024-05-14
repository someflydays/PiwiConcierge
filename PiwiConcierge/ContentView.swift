//
//  ContentView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/13/24.
//

import SwiftUI
import Lottie
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack(spacing: 20) {
            HeroSection(showImmersiveSpace: $showImmersiveSpace)
                .padding()

            RecommendationSection()
                .padding(.horizontal)

            NavigationMenu()
                .padding()
            
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color(.systemGray6)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

struct HeroSection: View {
    @Binding var showImmersiveSpace: Bool

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                // Background image
                Image("icon-background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100) // Adjusted size
                
                // Lottie animation
                LottieView(filename: "shopping-cart-animation")
                    .frame(height: 100) // Adjusted size
            }
            .padding(.bottom, 10)
            
            Text("Welcome to PiwiConcierge!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            Text("Discover personalized product recommendations and enjoy an immersive shopping experience.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: {
                showImmersiveSpace.toggle()
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

struct RecommendationSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for You")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<5) { _ in
                        InteractiveProductCard()
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemBackground))
                .shadow(radius: 10)
        )
    }
}

struct NavigationMenu: View {
    var body: some View {
        HStack {
            NavigationLink(destination: PlaceholderView()) {
                VStack {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding()

                    Text("Browse Categories")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 10)
                )
            }

            NavigationLink(destination: PlaceholderView()) {
                VStack {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding()

                    Text("Your Collection")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 10)
                )
            }
        }
    }
}

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

struct PlaceholderView: View {
    var body: some View {
        Text("This is a placeholder for the ARView.")
            .font(.largeTitle)
            .padding()
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
        animationView.loopMode = .playOnce
        
        animationView.play { (finished) in
            if finished {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // 1 second delay
                    animationView.play()
                }
            }
        }

        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
