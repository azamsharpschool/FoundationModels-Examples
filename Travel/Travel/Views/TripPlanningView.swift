//
//  TripPlanningView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/12/25.
//

import SwiftUI

struct TripPlanningView: View {
    
    let park: Park
    @State private var generatingItinerary: Bool = false
    
    @State private var itineraryPlanner: ItineraryPlanner?
    
    var body: some View {
        VStack {
            Button(generatingItinerary ? "Generating Iternary...": "Generate Iternary") {
                generatingItinerary = true
                Task {
                    do {
                        try await itineraryPlanner?.suggestItinerary()
                        generatingItinerary = false
                    } catch {
                        print(error.localizedDescription)
                        generatingItinerary = false
                    }
                }
            }
            .buttonStyle(.bordered)
            .glassEffect()
            .disabled(generatingItinerary)
            
            if let iternary = itineraryPlanner?.itinerary {
                ItineraryView(itinerary: iternary)
            }
        }.task {
            itineraryPlanner = ItineraryPlanner(park: park)
        }
    }
}

#Preview {
    TripPlanningView(
        park: Park(
            name: "Rocky Mountain National Park",
            description: "Set in Colorado, this park features majestic mountain peaks, alpine lakes, and a wide range of wildlife in the heart of the Rockies.",
            latitude: 40.3428,
            longitude: -105.6836
        )
    )

}
