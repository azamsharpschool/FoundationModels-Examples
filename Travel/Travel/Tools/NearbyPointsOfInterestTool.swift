//
//  NearbyPointsOfInterestTool.swift
//  Travel
//
//  Created by Mohammad Azam on 6/13/25.
//

import Foundation
import FoundationModels
import MapKit


struct FindNearbyPointsOfInterestTool: Tool {
    
    let park: Park
    
    var name: String = "findNearbyPointsOfInterest"
    var description: String = "Find points of interest near a national park."
    
    @Generable
    enum Category: String, CaseIterable {
        case hotel
        case restaurant
        case trail
        case campground
        case visitorCenter
        case viewpoint
        case picnicArea
        case museum
        case parking
        case rangerStation
        
        func toMapKitCategory() -> [MKPointOfInterestCategory] {
            
            Category.allCases.map {
                MKPointOfInterestCategory(rawValue: $0.rawValue)
            }
            
            
        }
    }
    
    @Generable
    struct Arguments {
        
        @Guide(description: "This is the type of destination to look for.")
        let pointOfInterestCategory: Category
        
        @Guide(description: "The natural language query of what to search for.")
        let naturalLanguageQuery: String
    }
    
    func call(arguments: Arguments) async throws -> ToolOutput {
        
        let items = try await findPointOfInterests(location: park.location, arguments: arguments)
        let results = items.prefix(10).compactMap { $0.name }
        print(results)
        return ToolOutput("There are these \(arguments.pointOfInterestCategory) near \(park.name): \(results.formatted())")
    }
    
    private func findPointOfInterests(location: CLLocationCoordinate2D, arguments: Arguments) async throws -> [MKMapItem] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = arguments.naturalLanguageQuery
        request.region = MKCoordinateRegion(center: location, latitudinalMeters: 20_000, longitudinalMeters: 20_000)
        request.pointOfInterestFilter = .init(including: arguments.pointOfInterestCategory.toMapKitCategory())
        let search = MKLocalSearch(request: request)
        let response = try await search.start()
        return response.mapItems
    }
    
}
