//
//  DayView.swift
//  Travel
//
//  Created by Mohammad Azam on 6/12/25.
//

import SwiftUI

struct DayView: View {
    
    let day: DayPlan.PartiallyGenerated
    
    var body: some View {
        VStack {
            if let day = day.day {
                Text("Day \(day)")
                    .padding(6)
                    .background(.green)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            }
            
            if let plan = day.plan {
                Text(plan)
            }
           
        }
    }
}

