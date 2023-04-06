//
//  Country.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

import SwiftUI

struct Country: Identifiable, Codable {
    var id = UUID()
    let name: String
    let isoCode: String
    let summary: String
}

let jsonString = """
[
    {
        "name": "United States",
        "isoCode": "us",
        "summary": "The United States is a country..."
    },
    {
        "name": "United Kingdom",
        "isoCode": "gb",
        "summary": "The United Kingdom is a country..."
    },
    {
        "name": "Canada",
        "isoCode": "ca",
        "summary": "Canada is a country..."
    }
]
"""

func decodeCountries(from jsonString: String) -> [Country] {
    let jsonData = Data(jsonString.utf8)
    let decoder = JSONDecoder()

    do {
        let countries = try decoder.decode([Country].self, from: jsonData)
        return countries
    } catch {
        print("Error decoding JSON: \(error)")
        return []
    }
}
