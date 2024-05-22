//
//  HomeView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header with personalized greeting
                ///HeaderView(userName: userData.userName)
                    ///.padding(.horizontal)

                // Display the RecommendationCarousel
                RecommendationCarousel()
                    .padding(.horizontal)

                // Add grouped recommendations below
                GroupedRecommendations()
                    .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userData: UserData())
    }
}
