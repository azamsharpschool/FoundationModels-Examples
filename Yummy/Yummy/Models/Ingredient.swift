//
//  Ingredient.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import Foundation 

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

extension Ingredient {
    static var preview: Set<Ingredient> {
        [
            Ingredient(name: "Tomato"),
            Ingredient(name: "Chicken"),
            Ingredient(name: "Spinach"),
            Ingredient(name: "Garlic")
        ]
    }
}
