//
//  CountrySuggestionRow.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CountrySuggestionRow: View {
    var country: Country

    var body: some View {
        HStack {
            WebImage(url: URL(string: "https://www.countryflags.io/\(country.isoCode)/flat/64.png"))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .cornerRadius(3)

            Text(country.name)
                .font(.headline)
        }
    }
}

struct CountrySuggestionRow_Previews: PreviewProvider {
    static var previews: some View {
        CountrySuggestionRow(country: Country(name: "United States", isoCode: "us", summary: ""))
            .previewLayout(.sizeThatFits)
    }
}

