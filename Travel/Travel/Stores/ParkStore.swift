//
//  ParkStore.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation
import Observation

@MainActor
@Observable
class ParkStore {
    
    var parks: [Park] = []
    
    func loadParks() {
        
        guard let url = Bundle.main.url(forResource: "parks", withExtension: "json") else {
            print("❌ parks.json not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedParks = try JSONDecoder().decode([Park].self, from: data)
            self.parks = decodedParks
            print("✅ Loaded \(parks.count) parks")
        } catch {
            print("❌ Failed to load parks: \(error)")
        }
    }
    
}
