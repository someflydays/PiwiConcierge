//
//  DashboardView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var userData = UserData()

    var body: some View {
        TabView {
            HomeView(userData: userData)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

            ProfileView(userData: userData)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
