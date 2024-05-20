//
//  HeaderView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome back, \(userData.profile.firstName)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("What would you like to discover today?")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(userData.profile.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(UserData())
    }
}
