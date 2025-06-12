//
//  ContentView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Playgrounds
import SwiftUI
import FoundationModels

#Playground {
    
    let session = LanguageModelSession()
    let prompt = "Generate a list of national parks in United States."  
    
    let response = try await session.respond(to: prompt, generating: SearchSuggestions.self)
    
}

struct ContentView: View {
    
    @Environment(ParkStore.self) private var store
    
    var body: some View {
        List(store.parks) { park in
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
            store.loadParks()
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
    .environment(ParkStore())
}
