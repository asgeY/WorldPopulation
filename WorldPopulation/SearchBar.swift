//
//  SearchBar.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

// SearchBar.swift
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator

        // Customize the search bar appearance
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = UIColor.darkGray
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.darkGray.cgColor
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true

        // Add the placeholder text here
        searchBar.placeholder = "Search country"

        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        let parent: SearchBar

        init(_ searchBar: SearchBar) {
            self.parent = searchBar
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}
