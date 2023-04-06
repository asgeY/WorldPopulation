//
//  HistoricalDataView.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

import SwiftUI


struct HistoricalDataView: View {
    var selectedCountry: Country
    
    @State  var countrySummary: String
    
    // Replace the following data with the actual historical population data
    let historicalData: [(year: String, population: Int)] = [
        ("2015", 1000000),
        ("2016", 1020000),
        ("2017", 1040000),
        ("2018", 1060000),
        ("2019", 1080000),
        ("2020", 1100000)
    ]
    init(selectedCountry: Country) {
            self.selectedCountry = selectedCountry
            self._countrySummary = State(initialValue: selectedCountry.summary)
        }
        
    var body: some View {
        VStack {
            Text("Historical Population Data")
                .font(.title)
                .padding()
            
            // Add the detailed historical data view here
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(historicalData, id: \.year) { dataPoint in
                        HistoricalDataRow(year: dataPoint.year, population: dataPoint.population, countryCode: selectedCountry.isoCode)
                    }

                }
                .padding()
            }
            // Add the country summary here
            if !countrySummary.isEmpty {
                Text("Country Summary:")
                    .font(.headline)
                    .padding(.top)
                
                Text(countrySummary)
                    .font(.body)
                    .padding()
            }
            
            
            Spacer()
        }
    }
}

//struct HistoricalDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoricalDataView(selectedCountry: Country(name: "United States", isoCode: "us", summary: ""))
//    }
//}
//
//
//
