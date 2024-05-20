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
        Text("Welcome back, \(userData.userName)!")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userData: UserData())
    }
}
