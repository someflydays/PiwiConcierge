//
//  SearchBar.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/27/24.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                searchBar.text = ""
                self.text = ""
                searchBar.resignFirstResponder()
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search products..."
        searchBar.autocapitalizationType = .none
        searchBar.showsCancelButton = true
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
