//
//  BarCart.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

import SwiftUI

struct BarChart: View {
    var data: [CGFloat]
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(data.indices, id: \.self) { index in
                VStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 20, height: data[index])
                    Text("\(Int(data[index]))")
                        .font(.caption)
                }
            }
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(data: [100, 150, 200, 250, 300, 350, 400, 450])
    }
}

