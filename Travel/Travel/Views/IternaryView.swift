//
//  IternaryView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/12/25.
//

import SwiftUI

struct IternaryView: View {
    
    let iternary: Itinerary.PartiallyGenerated
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let title = iternary.title {
                Text(title)
                    .font(.title)
            }
            
            if let days = iternary.days {
                ForEach(days) { day in
                    DayView(day: day)
                }
            }
        }.padding()
            .animation(.easeIn, value: iternary)
    }
}

#Preview {
    IternaryView(iternary: Itinerary.preview)
}
