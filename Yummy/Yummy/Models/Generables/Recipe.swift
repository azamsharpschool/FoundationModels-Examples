//
//  Recipe.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import Foundation
import FoundationModels

@Generable
struct Recipe: Equatable {
    
    @Guide(description: "The title of the recipe, such as 'Spicy Garlic Chicken' or 'Creamy Mushroom Pasta'.")
    let name: String
    
    @Guide(description: "A short description of the recipe, including flavor, main ingredients, or how it’s typically served.")
    let description: String
}

@Generable
struct RecipeStep {
    
    @Guide(description: "The step number in the recipe, starting from 1 and increasing sequentially.")
    let order: Int
    
    @Guide(description: "A clear instruction for this step, describing what needs to be done.")
    let instruction: String
}


extension Recipe: InstructionsRepresentable {
    
    static var sample: Recipe {
        
        .init(
            name: "Garlic Tomato Chicken with Spinach",
            description: "A savory dish featuring tender chicken cooked in a rich garlic-tomato sauce, served with wilted spinach for a wholesome and flavorful meal."
        )
    }
}


