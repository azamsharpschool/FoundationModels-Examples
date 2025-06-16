//
//  RecipeRecommender.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import Foundation
import Observation
import FoundationModels

@MainActor
@Observable
class RecipeRecommender {
    
    var recipes: [Recipe.PartiallyGenerated] = []
    let session: LanguageModelSession
    
    init() {
        self.session = LanguageModelSession {
            "You are a helpful recipe assistant that creates delicious and easy-to-follow recipes based on the provided ingredients."
            
            "Here is a recipe based on ingredients Tomato, Chicken, Spinach, and Garlic:"
            
            Recipe.sample
        }
    }
    
    func suggestRecipes(ingredients: Set<Ingredient>) async throws {
        
        let prompt = "Suggest 3-5 recipes based on the following ingredients: \n \(ingredients.map(\.name).joined(separator: ", "))"
        
        print(prompt)
        
        let stream = session.streamResponse(to: prompt, generating: [Recipe].self)
        for try await partialResponse in stream {
            recipes = partialResponse
        }
      
    }
    
}
