//
//  Iternary.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation
import FoundationModels

@Generable
struct Itinerary {
    
    @Guide(description: "Detailed plan for each day of the itinerary, including the day number and a description of planned activities.", .count(3))
    var days: [DayPlan]

    @Guide(description: "This will serve as the summary of the 3-day travel itinerary.")
    var summary: String
}

@Generable 
struct DayPlan: Equatable {
    @Guide(description: "The day number within the itinerary (e.g., 1 for Day 1).")
    let day: Int

    @Guide(description: "A detailed description of the planned activities, locations, and experiences for this day.")
    let plan: String
}
