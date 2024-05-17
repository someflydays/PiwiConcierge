//
//  DashboardView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(spacing: 20) {
            RecommendationSection()
                .padding(.horizontal)

            NavigationMenu()
                .padding()
            
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.15)
        )
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
