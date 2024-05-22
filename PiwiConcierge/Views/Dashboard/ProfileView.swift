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
            Text("Profile View for \(userData.userName)")
                .font(.largeTitle)
                .padding()

            // Add more profile-related UI here
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userData: UserData())
    }
}
