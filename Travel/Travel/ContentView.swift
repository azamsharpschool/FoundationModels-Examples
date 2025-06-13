//
//  ContentView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//


import SwiftUI
import FoundationModels

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
