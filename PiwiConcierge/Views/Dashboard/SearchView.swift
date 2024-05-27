//
//  SearchView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        SearchBar(text: $searchText)
            .frame(width: 500) // Adjust width of Search Bar
            .padding(.horizontal)
            .cornerRadius(20)
            .shadow(radius: 5)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
