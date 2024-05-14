//
//  ContentView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/13/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            HeaderView()
                .padding()

            RecommendationSection()
                .padding()

            Spacer()
            
            NavigationSection(showImmersiveSpace: $showImmersiveSpace)
                .padding()
            
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(radius: 10)
        )
        .padding()
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

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Welcome to PiwiConcierge!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            Text("Discover personalized product recommendations and enjoy an immersive shopping experience.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing, .bottom])
        }
    }
}

struct RecommendationSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for You")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 10)

            // Placeholder for product recommendations
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        ProductCard()
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.secondarySystemBackground))
                .shadow(radius: 5)
        )
    }
}

struct NavigationSection: View {
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        VStack {
            NavigationLink(destination: PlaceholderView()) {
                Text("Start Shopping")
                    .font(.title2)
                    .padding()
                    .frame(width: 300)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)

            Button(action: {
                showImmersiveSpace.toggle()
            }) {
                Text("Enter Immersive Space")
                    .font(.title2)
                    .padding()
                    .frame(width: 300)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct ProductCard: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .padding(.bottom, 5)
            
            Text("Product Name")
                .font(.caption)
                .fontWeight(.semibold)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .padding([.leading, .trailing], 5)
    }
}

struct PlaceholderView: View {
    var body: some View {
        Text("This is a placeholder for the ARView.")
            .font(.largeTitle)
            .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
