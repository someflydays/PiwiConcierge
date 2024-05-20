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
    @State private var showDashboard = false

    var body: some View {
        if showDashboard {
            DashboardView()
        } else {
            WelcomeView(showDashboard: $showDashboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
