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
    
    @Guide(.count(3))
    let activities: [Activity]
}

@Generable
struct Activity: Equatable {
    
    @Guide(description: "The category or kind of the activity, such as hiking or camping.")
    let type: ActivityKind
    
    @Guide(description: "A short, descriptive title for the activity, like 'Sunset Hike at Canyon Trail'.")
    let title: String
    
    @Guide(description: "A detailed description of the activity, including what to expect and any important notes.")
    let description: String
}

extension Activity {
    
    static var preview: Activity.PartiallyGenerated {
           try! Activity.PartiallyGenerated(
               GeneratedContent(
                   Activity(
                       type: .nature,
                       title: "Explore Hidden Falls",
                       description: "Take a scenic trail through the forest to reach Hidden Falls, a serene waterfall surrounded by lush greenery and wildlife."
                   )
               )
           )
       }
    
}


@Generable
enum ActivityKind: String, Equatable {
    case hiking
    case camping
    case wildlifeViewing
    case scenicDrive
    case photography
    case sightseeing
    case nature
    case walking
}

extension Itinerary: InstructionsRepresentable {
    
    static var exampleTripToNationalPark: Itinerary {
        Itinerary(
            title: "Adventure Through Yellowstone National Park",
            description: "Discover the geothermal wonders, scenic hikes, and wildlife of America's first national park on this immersive 3-day journey.",
            days: [
                DayPlan(
                    day: 1,
                    plan: "Arrive at Yellowstone and explore the famous geysers and hot springs in the park's western region.",
                    activities: [
                        Activity(
                            type: .sightseeing,
                            title: "Old Faithful Geyser",
                            description: "Watch one of the most predictable geothermal features in the world erupt approximately every 90 minutes."
                        ),
                        Activity(
                            type: .nature,
                            title: "Grand Prismatic Spring",
                            description: "Marvel at the vibrant colors of this enormous hot spring, best viewed from the overlook trail."
                        ),
                        Activity(
                            type: .walking,
                            title: "Fountain Paint Pot Trail",
                            description: "Stroll past mud pots, fumaroles, and geysers on this short, accessible boardwalk trail."
                        )
                    ]
                ),
                DayPlan(
                    day: 2,
                    plan: "Hike through scenic landscapes and keep an eye out for bison and other wildlife.",
                    activities: [
                        Activity(
                            type: .hiking,
                            title: "Lamar Valley",
                            description: "Go on an early morning hike for a chance to see wolves, bears, and herds of bison in this wildlife-rich valley."
                        ),
                        Activity(
                            type: .nature,
                            title: "Yellowstone Lake Picnic",
                            description: "Enjoy a relaxing picnic by the shores of Yellowstone Lake with stunning mountain views."
                        ),
                        Activity(
                            type: .camping,
                            title: "Campfire Evening",
                            description: "Wrap up the day with a cozy campfire, s’mores, and storytelling under the stars."
                        )
                    ]
                ),
                DayPlan(
                    day: 3,
                    plan: "Visit the dramatic canyons and waterfalls before heading home.",
                    activities: [
                        Activity(
                            type: .sightseeing,
                            title: "Grand Canyon of the Yellowstone",
                            description: "Hike to Artist Point for breathtaking views of the colorful canyon and Lower Falls."
                        ),
                        Activity(
                            type: .photography,
                            title: "Upper Falls Viewpoint",
                            description: "Capture the power and beauty of the Upper Falls from the overlook trail."
                        ),
                        Activity(
                            type: .walking,
                            title: "Geyser Basin Drive",
                            description: "Take a leisurely drive with stops at various basins to say goodbye to the park’s geothermal wonders."
                        )
                    ]
                )
            ],
            summary: "This 3-day Yellowstone adventure blends hiking, wildlife spotting, geothermal exploration, and quiet moments in nature—perfect for outdoor lovers and first-time visitors alike."
        )
    }


    
    static var preview: Itinerary.PartiallyGenerated {
        return try! Itinerary.PartiallyGenerated(
            GeneratedContent(
                Itinerary(
                    title: "Exciting Trip to the Rocky Mountains",
                    description: "An adventurous 3-day journey exploring scenic trails, wildlife, and local culture in the heart of the Rockies.",
                    days: [
                        DayPlan(
                            day: 1,
                            plan: "Arrive and take a scenic drive through the national park. Visit the visitor center and enjoy a sunset hike.",
                            activities: [
                                Activity(
                                    type: .sightseeing,
                                    title: "Scenic Drive Through Trail Ridge Road",
                                    description: "Enjoy panoramic views as you ascend to over 12,000 feet on one of the highest paved roads in North America."
                                ),
                                Activity(
                                    type: .nature,
                                    title: "Beaver Meadows Visitor Center",
                                    description: "Learn about the park's geology, wildlife, and hiking trails from rangers and interactive exhibits."
                                ),
                                Activity(
                                    type: .hiking,
                                    title: "Sunset Hike at Bear Lake",
                                    description: "Take a short hike around Bear Lake and enjoy the alpine glow on the surrounding peaks as the sun sets."
                                )
                            ]
                        )
                    ],
                    summary: "This itinerary offers a perfect mix of adventure and relaxation across the Rocky Mountains in three unforgettable days."
                )
            )
        )
    }

}
