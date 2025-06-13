//
//  ContentView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//


import SwiftUI
import FoundationModels

struct ParkListScreen: View {
    
    @State private var parks: [Park] = []
    
    private func loadParks() {
        
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
    
    var body: some View {
        List(parks) { park in
            NavigationLink {
                ParkDetailScreen(park: park)
            } label: {
                VStack(alignment: .leading, spacing: 10) {
                    Text(park.name)
                        .font(.headline)
                    Text(park.description)
                }
            }
        }
        .navigationTitle("Parks")
        .listStyle(.plain)
        .task {
            loadParks()
        }
    }
}

#Preview {
    NavigationStack {
        ParkListScreen()
    }
}
