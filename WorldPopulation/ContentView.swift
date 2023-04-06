//
//  ContentView.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//


import SwiftUI

struct ContentView: View {
    @State private var worldPopulation: WorldPopulation?
    @State private var timer: Timer?
    @State private var searchText: String = ""
    @State private var showHistoricalData = false
    @State private var showAlert = false
    @State private var countries: [Country] = decodeCountries(from: jsonString)
    @State private var selectedCountry: Country?
    

    @Environment(\.colorScheme) var colorScheme
    
    private let worldPopulationService = WorldPopulationService()
    
    var body: some View {
        ZStack {
            // Add the background gradient view
            BackgroundGradientView()
            
            VStack(spacing: 30) {
                Text("World Population")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                Group {
                    Text("Total Population")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                    
                    if let population = worldPopulation?.population {
                        Text("\(population)")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                    } else {
                        Text("8,072,586,503")
                    }
                }
                
                Group {
                    Text("Births")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                    
                    if let births = worldPopulation?.births {
                        Text("\(births)")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                    } else {
                        Text("353,456")
                    }
                }
                
                Group {
                    Text("Deaths")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                    
                    if let deaths = worldPopulation?.deaths {
                        Text("\(deaths)")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                    } else {
                        Text("176,344")
                    }
                }
                Button(action: {
                    if searchText.isEmpty {
                        showAlert = true
                    } else {
                        showHistoricalData = true
                    }
                }) {
                    Text("Show Historical Data")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 12)
                        .background(colorScheme == .dark ? Color.gray.opacity(0.8) : Color.gray)
                        .cornerRadius(8)
                }
            }
            
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .padding()
            
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Info"),
                message: Text("Please search a country in order to see historical data."),
                dismissButton: .default(Text("OK"))
            )
        }
        
        .sheet(isPresented: $showHistoricalData) {
            Group {
                if let selectedCountry = selectedCountry {
                    HistoricalDataView(selectedCountry: selectedCountry)
                } else {
                    Text("No country selected")
                }
            }
            .onAppear(perform: startFetchingPopulation)
            .onDisappear(perform: {
                
                timer?.invalidate()
            })
        }
        if !searchText.isEmpty {
            CountrySearchSuggestions(
                searchText: searchText,
                countries: countries,
                onSelectCountry: { country in
                    selectedCountry = country
                    searchText = country.name // Update the searchText to the selected country's name
                }
            )
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .padding([.top, .horizontal], 10)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            .transition(.move(edge: .top))
        }
        
        
    }
    
    func startFetchingPopulation() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            worldPopulationService.fetchWorldPopulation { population in
                DispatchQueue.main.async {
                    self.worldPopulation = population
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .environment(\.colorScheme, .light)
                .previewDisplayName("Light Mode")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
