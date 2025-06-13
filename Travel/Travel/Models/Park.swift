//
//  Park.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation

struct Park: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double

    private enum CodingKeys: String, CodingKey {
        case name, description, latitude, longitude
        
    }
}

