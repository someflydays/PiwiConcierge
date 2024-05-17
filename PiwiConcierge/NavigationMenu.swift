//
//  NavigationMenu.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI

struct NavigationMenu: View {
    var body: some View {
        HStack {
            NavigationLink(destination: PlaceholderView()) {
                VStack {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding()

                    Text("Browse Categories")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 10)
                )
            }

            NavigationLink(destination: PlaceholderView()) {
                VStack {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding()

                    Text("Your Collection")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 10)
                )
            }
        }
    }
}

struct NavigationMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenu()
    }
}
