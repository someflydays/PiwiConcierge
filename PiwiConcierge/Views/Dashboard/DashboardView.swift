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
                    Label("Home", systemImage: "house.fill") // find a new symbol
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill") // alternate the symbol based on if cart is empty or not
                }
            
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark.fill")
                }

            ProfileView(userData: userData)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
