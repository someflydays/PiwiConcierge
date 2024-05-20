//
//  DashboardView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DashboardView: View {
    @State private var selectedTab = 0
    @StateObject var userData = UserData()

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
                .tag(2)

            ProfileView(userData: userData)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(3)
        }
        .environmentObject(userData)
    }
}
