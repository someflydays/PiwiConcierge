//
//  Profile.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import Foundation

struct Profile {
    var firstName: String
    var lastName: String
    var email: String
    var profilePicture: String
}

class UserData: ObservableObject {
    @Published var profile = Profile(firstName: "User", lastName: "", email: "user@example.com", profilePicture: "profile-picture")
}
