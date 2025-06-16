//
//  Ingredient.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import Foundation
import FoundationModels

struct Ingredient: Identifiable, Hashable, Sendable {
    let id = UUID()
    let name: String
}

extension Ingredient: InstructionsRepresentable {
    
    var instructionsRepresentation: Instructions {
        .init(name)
    }
    
    static var preview: Set<Ingredient> {
        [
            Ingredient(name: "Tomato"),
            Ingredient(name: "Chicken"),
            Ingredient(name: "Spinach"),
            Ingredient(name: "Garlic")
        ]
    }
}
