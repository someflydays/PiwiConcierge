//
//  UserData.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var profile = Profile(firstName: "User", lastName: "", email: "user@example.com", profilePicture: "profile-picture")
}
