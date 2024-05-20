//
//  PiwiConciergeApp.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/13/24.
//

import SwiftUI

@main
struct PiwiConciergeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
