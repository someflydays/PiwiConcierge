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
                Text("Welcome back, \(userData.userName)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("What would you like to discover today?")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(UserData())
    }
}
