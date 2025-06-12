//
//  ParkStore.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation
import Observation
import FoundationModels

@MainActor
@Observable
class ParkStore {
    
    var parks: [Park] = []
    var session: LanguageModelSession
    var iternary: Itinerary.PartiallyGenerated?
    
    init() {
        self.session = LanguageModelSession(instructions: "You are a helpful travel assistant. Your task is to create personalized and informative travel itineraries based on the user's preferences and inputs. Provide clear, concise, and friendly suggestions.")
    }
    
    func loadIternary(parkName: String) async throws {
        
        let prompt = "Create a 3-day travel itinerary for \(parkName), including daily activities, suggested times, and brief descriptions of each stop. Make it engaging and suitable for first-time visitors."

        let stream = session.streamResponse(to: prompt, generating: Itinerary.self)
        
        for try await partial in stream {
            self.iternary = partial
        }
        
    }
    
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
