//
//  HomeView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userData: UserData

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
