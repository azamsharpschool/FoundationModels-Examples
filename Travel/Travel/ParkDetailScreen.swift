//
//  ParkDetailScreen.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import SwiftUI
import FoundationModels

struct ParkDetailScreen: View {
    
    let park: Park
    private let model = SystemLanguageModel.default
    
    var body: some View {
        
        ScrollView {
            Text(park.description)
            switch model.availability {
            case .available:
                TripPlanningView(park: park)
            case .unavailable(.appleIntelligenceNotEnabled):
                Text("Travel app is not available because Apple Intelligence has not been turned on.")
            case .unavailable(.modelNotReady):
                Text("Travel app is not ready yet.")
            default:
                Text(park.description)
            }
    }
        .padding()
        .navigationTitle(park.name)
    }
}

#Preview {
    NavigationStack {
        ParkDetailScreen(park: Park(name: "Rocky Mountains", description: "Set in Colorado, this park features majestic mountain peaks, alpine lakes, and a wide range of wildlife in the heart of the Rockies."))
    }.environment(ParkStore())
}
