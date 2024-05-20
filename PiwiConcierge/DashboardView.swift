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

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(3)
        }
        ///.background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color(.systemGray6).opacity(0.8)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HeaderView()
                    .padding(.horizontal)

                FeaturedSection()
                    .padding(.horizontal)

                RecommendationCarousel()
                    .padding(.horizontal)

                CategoryNavigation()
                    .padding(.horizontal)

                PromotionsSection()
                    .padding(.horizontal)

                Spacer(minLength: 20)
            }
        }
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search View")
    }
}

struct CartView: View {
    var body: some View {
        Text("Cart View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome back, Derek!") // Change this to "Welcome back, [user's first name]!" #TODO
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding() // I added this
                Text("What would you like to discover today?")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image("profile-picture")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

struct FeaturedSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Featured")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        FeaturedItemCard(index: index)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct FeaturedItemCard: View {
    let index: Int

    var body: some View {
        VStack {
            Model3D(named: "featured-model-\(index)", bundle: realityKitContentBundle)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)

            Text("Featured Item \(index + 1)")
                .font(.headline)
                .foregroundColor(.primary)

            Text("$99.99")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 150)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct RecommendationCarousel: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended for You")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        InteractiveProductCard(index: index)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CategoryNavigation: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Browse Categories")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<4) { index in
                        CategoryCard(index: index)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CategoryCard: View {
    let index: Int

    var body: some View {
        VStack {
            Image("category-\(index)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .shadow(radius: 5)

            Text("Category \(index + 1)")
                .font(.headline)
                .foregroundColor(.primary)
        }
        .frame(width: 80)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct PromotionsSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Promotions")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        PromotionCard(index: index)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PromotionCard: View {
    let index: Int

    var body: some View {
        VStack {
            Image("promotion-\(index)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)

            Text("Promotion \(index + 1)")
                .font(.headline)
                .foregroundColor(.primary)

            Text("Save 20%")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 150)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
