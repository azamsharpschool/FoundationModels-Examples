//
//  IternaryView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/12/25.
//

import SwiftUI

struct ItineraryView: View {
    
    let itinerary: Itinerary.PartiallyGenerated
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let title = itinerary.title {
                Text(title)
                    .font(.title)
            }
            
            if let description = itinerary.description {
                Text(description)
                    .opacity(0.5)
            }
            
            if let days = itinerary.days {
                ForEach(days) { day in
                    DayView(day: day)
                }.transition(.blurReplace)
            }
        }.padding()
            .animation(.easeInOut, value: itinerary)
    }
}

#Preview {
    ItineraryView(itinerary: Itinerary.preview)
}
