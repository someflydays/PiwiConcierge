//
//  ProfileView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack {
            Image(userData.profile.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)

            Text("\(userData.profile.firstName) \(userData.profile.lastName)")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(userData.profile.email)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
    }
}
