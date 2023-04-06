//
//  CountrySearchSuggestions.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CountrySearchSuggestions: View {
    var searchText: String
    var countries: [Country]
    var onSelectCountry: (Country) -> Void

    private var filteredCountries: [Country] {
        if searchText.isEmpty {
            return []
        }
        return countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }

    var body: some View {
        List(filteredCountries) { country in
            CountrySuggestionRow(country: country)
                .onTapGesture {
                    onSelectCountry(country)
                }
        }
    }
}

struct CountrySearchSuggestions_Previews: PreviewProvider {
    static var previews: some View {
        CountrySearchSuggestions(
            searchText: "United",
            countries: [
                Country(name: "United States", isoCode: "us", summary: ""),
                Country(name: "United Kingdom", isoCode: "gb", summary: "")
            ],
            onSelectCountry: { _ in }
        )
    }
}

