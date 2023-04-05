//
//  WorldPopulationService.swift
//  WorldPopulation
//
//  Created by AsgeY on 4/4/23.
//

// WorldPopulationService.swift
import Foundation

class WorldPopulationService {
    private let apiKey = "YOUR_API_KEY"
    private let apiUrl = "https://population.io"
    
    func fetchWorldPopulation(completion: @escaping (WorldPopulation?) -> Void) {
        guard let url = URL(string: "\(apiUrl)?api_key=\(apiKey)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            let worldPopulation = try? decoder.decode(WorldPopulation.self, from: data)
            completion(worldPopulation)
        }.resume()
    }
}

