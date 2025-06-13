//
//  TripPlanningView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/12/25.
//

import SwiftUI

struct TripPlanningView: View {
    
    let park: Park 
    @Environment(ParkStore.self) private var store
    @State private var generatingItinerary: Bool = false
    
    var body: some View {
        Button(generatingItinerary ? "Generating Iternary...": "Generate Iternary") {
            generatingItinerary = true
            Task {
                do {
                    try await store.loadIternary(parkName: park.name)
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
        
        if let iternary = store.iternary {
            IternaryView(iternary: iternary)
        }
    }
}

#Preview {
    TripPlanningView(park: Park(name: "Rocky Mountain National Park", description: "Set in Colorado, this park features majestic mountain peaks, alpine lakes, and a wide range of wildlife in the heart of the Rockies."))
        .environment(ParkStore())
}
