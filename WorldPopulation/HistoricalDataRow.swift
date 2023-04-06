//
//  HistoricalDataRow.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//


import SwiftUI
import SDWebImageSwiftUI

struct HistoricalDataRow: View {
    let year: String
    let population: Int
    let countryCode: String
    
    var body: some View {
        HStack {
            HStack {
                Text(year)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                
                Spacer()
                
                // Display the country flag
                Text(emojiFlag(countryCode: countryCode))
                    .font(.system(size: 20))
                
                Text("\(population)")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            // Add the WebImage view here to display the flag
            WebImage(url: URL(string: "https://www.countryflags.io/\(countryCode)/flat/64.png"))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .cornerRadius(3)
            
            VStack(alignment: .leading) {
                Text(year)
                    .font(.headline)
                
                Text("\(population)")
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct HistoricalDataRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalDataRow(year: "2020", population: 1000000, countryCode: "")
            .previewLayout(.sizeThatFits)
    }
}

func emojiFlag(countryCode: String) -> String {
    var string = ""
    let country = countryCode.uppercased()
    
    for uS in country.unicodeScalars {
        let u = 127397 + uS.value
        if let uSE = UnicodeScalar(u) {
            string.unicodeScalars.append(uSE)
        }
    }
    return string
}
