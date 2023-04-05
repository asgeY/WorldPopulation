//
//  HistoricalDataRow.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//


import SwiftUI

struct HistoricalDataRow: View {
    var year: String
    var population: Int

    var body: some View {
        HStack {
            Text(year)
                .font(.body)
                .fontWeight(.bold)
            Spacer()
            Text("\(population)")
                .font(.body)
                .fontWeight(.semibold)
        }
    }
}

struct HistoricalDataRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalDataRow(year: "2020", population: 1000000)
            .previewLayout(.sizeThatFits)
    }
}

