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
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
        
        let recipeTool = RecipeTool(httpClient: httpClient)
      
        self.session = LanguageModelSession(tools: [recipeTool]) {
                """
                You are a helpful recipe assistant that creates delicious and easy-to-follow recipes based on the provided ingredients.
                """
                """
                When the ingredients include rice, you must always use recipeTool to fetch rice recipes. Here is an example of ingredients with rice:
                """
                [Ingredient(name: "Rice")]
                [Ingredient(name: "Rice"), Ingredient(name: "Onion")]
                [Ingredient(name: "Rice"), Ingredient(name: "Chicken")]
                
                """
                If rice is not one of the ingredients, you should generate the recipes yourself.
                """
                
        }
    }
    
    func suggestRecipes(ingredients: Set<Ingredient>) async throws {
        
        let prompt = "Suggest 3-5 recipes based on the following ingredient(s): \n \(ingredients.map(\.name).joined(separator: ", "))"
        
        print(prompt)
        
        let stream = session.streamResponse(to: prompt, generating: [Recipe].self)
        for try await partialResponse in stream {
            recipes = partialResponse
        }
        
    }
    
}
