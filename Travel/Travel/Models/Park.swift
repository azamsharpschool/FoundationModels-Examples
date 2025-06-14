//
//  Park.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation
import MapKit

struct Park: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    private enum CodingKeys: String, CodingKey {
        case name, description, latitude, longitude
    }
}

