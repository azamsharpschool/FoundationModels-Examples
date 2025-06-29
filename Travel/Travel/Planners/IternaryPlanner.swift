//
//  IternaryPlanner.swift
//  Travel
//
//  Created by Mohammad Azam on 6/12/25.
//

import Foundation
import Observation
import FoundationModels

@MainActor
@Observable
final class ItineraryPlanner {
    
    private(set) var itinerary: Itinerary.PartiallyGenerated?
    var session: LanguageModelSession
    let park: Park
    
    init(park: Park) {
        self.park = park
        let pointOfInterestsTool = FindNearbyPointsOfInterestTool(park: park)
        self.session = LanguageModelSession(tools: [pointOfInterestsTool]) {
            "You are a helpful travel assistant. Your task is to create personalized and informative travel itineraries based on the user's preferences and inputs. Provide clear, concise, and friendly suggestions."
            
            """
            Use the findNearbyPointsOfInterest tool to find various 
            businesses and activities near \(park.name). 
            """
            
            """
            Here is a description for \(park.name) for your reference:
            """
            park.description
            
            "Here is an example of itinerary:"
            Itinerary.exampleTripToNationalPark
        }
    
    }
    
    func suggestItinerary() async throws {
        
        let prompt = "Create a 3-day travel itinerary for \(park.name), including daily activities, suggested times, and brief descriptions of each stop. Make it engaging and suitable for first-time visitors."

        let stream = session.streamResponse(to: prompt, generating: Itinerary.self)
        
        for try await partial in stream {
            self.itinerary = partial
        }
    }
}
