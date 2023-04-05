//
//  HistoricalDataView.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

// HistoricalDataView.swift
import SwiftUI

struct HistoricalDataView: View {
    
    @State private var countrySummary: String = "The U.S. is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean. Major Atlantic Coast cities are New York, a global finance and culture center, and capital Washington, DC. Midwestern metropolis Chicago is known for influential architecture and on the west coast, Los Angeles' Hollywood is famed for filmmaking."
    
    // Replace the following data with the actual historical population data
    let historicalData: [(year: String, population: Int)] = [
        ("2015", 1000000),
        ("2016", 1020000),
        ("2017", 1040000),
        ("2018", 1060000),
        ("2019", 1080000),
        ("2020", 1100000)
    ]
    
    var body: some View {
        VStack {
            Text("Historical Population Data")
                .font(.title)
                .padding()
            
            // Add the detailed historical data view here
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(historicalData, id: \.year) { dataPoint in
                        HistoricalDataRow(year: dataPoint.year, population: dataPoint.population)
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

struct HistoricalDataView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalDataView()
    }
}



