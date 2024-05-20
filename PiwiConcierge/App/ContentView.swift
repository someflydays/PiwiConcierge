//
//  ContentView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showDashboard = false
    @ObservedObject var userData = UserData()

    var body: some View {
        if showDashboard {
            DashboardView(userData: userData)
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
