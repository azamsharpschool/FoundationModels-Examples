//
//  Iternary.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation
import FoundationModels

@Generable
struct Itinerary: Equatable {
    
    @Guide(description: "A descriptive title for the itinerary, such as the destination or theme of the trip.")
    let title: String
    
    @Guide(description: "A general description providing context, tone, or highlights of the trip.")
    let description: String
    
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

extension Itinerary: InstructionsRepresentable {
    
    static var exampleTripToJapan: Itinerary {
        Itinerary(
            title: "Cultural Journey Through Japan",
            description: "Experience the beauty, history, and culinary delights of Japan in this immersive 3-day adventure through Tokyo, Kyoto, and Nara.",
            days: [
                DayPlan(day: 1, plan: "Arrive in Tokyo. Visit the historic Asakusa district, explore Senso-ji Temple, and enjoy street food at Nakamise Shopping Street."),
                DayPlan(day: 2, plan: "Take the bullet train to Kyoto. Tour Fushimi Inari Shrine, stroll through the Arashiyama Bamboo Grove, and attend a traditional tea ceremony."),
                DayPlan(day: 3, plan: "Spend the morning in Nara visiting Todai-ji Temple and feeding the friendly deer in Nara Park. Return to Tokyo for shopping in Shibuya.")
            ],
            summary: "A 3-day whirlwind tour through Japan’s top cultural sites, blending modern excitement with ancient tradition. Ideal for first-time visitors who want a rich, diverse experience."
        )
    }
    
    static var preview: Itinerary.PartiallyGenerated {
        
        return try! Itinerary.PartiallyGenerated(
            GeneratedContent(
                Itinerary(
                    title: "Exciting trip to Rocky Mountains",
                    description: "An adventurous 3-day journey exploring scenic trails, wildlife, and local culture in the heart of the Rockies.", days: [
                        DayPlan(day: 1, plan: "Arrive and take a scenic drive through the national park. Visit the visitor center and enjoy a sunset hike.")
                    ],
                    summary: "This itinerary offers a perfect mix of adventure and relaxation across the Rocky Mountains in three unforgettable days."
                )
            )
        )
        
    }
}
