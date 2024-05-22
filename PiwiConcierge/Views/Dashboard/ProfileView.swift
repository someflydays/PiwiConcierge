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
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Text("Welcome back, \(userData.userName)!")
                .font(.title2)
                .padding(.top)

            Spacer()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userData: UserData())
    }
}
