//
//  ParkDetailScreen.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import SwiftUI

struct ParkDetailScreen: View {
    
    let park: Park
    
    var body: some View {
        VStack {
            Text(park.description)
            Button("Generate Iternary") {
                
            }
            .buttonStyle(.bordered)
            .glassEffect()
            
            Spacer()
        }
        .padding()
        .navigationTitle(park.name)
    }
}

#Preview {
    NavigationStack {
        ParkDetailScreen(park: Park(name: "Rocky Mountains", description: "Set in Colorado, this park features majestic mountain peaks, alpine lakes, and a wide range of wildlife in the heart of the Rockies."))
    }
}
