//
//  BackgroundGradientView.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//


import SwiftUI

struct BackgroundGradientView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    colorScheme == .dark ? Color.black : Color.blue.opacity(0.3),
                    colorScheme == .dark ? Color.black : Color("LightBlue").opacity(0.3)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}

