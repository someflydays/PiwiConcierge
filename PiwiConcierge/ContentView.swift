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
        NavigationView {
            VStack {
                ///Spacer()
                
                Text("Welcome to PiwiConcierge!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                    .font(.title2)
                    .frame(width: 300)
                    .padding()
                    .glassBackgroundEffect()
                    .cornerRadius(10)
                    .padding(.bottom, 20)

                NavigationLink(destination: PlaceholderView()) {
                    Text("Start Shopping")
                        .font(.title2)
                        .padding()
                        .frame(width: 300)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                ///Spacer()
            }
            .padding()
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
