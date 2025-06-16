//
//  RecipeTool.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/16/25.
//

import FoundationModels

struct RecipeTool: Tool {
    
    let httpClient: HTTPClient
    
    var name = "recipeTool"
    var description = "Fetches Pakistani rice recipes based on provided ingredients by calling a recipe API."
    
    @Generable
    struct Arguments {
        @Guide(description: "A list of ingredients to base the Pakistani rice recipe recommendations on.")
        let ingredients: [String]
    }
    
    nonisolated func call(arguments: Arguments) async throws -> ToolOutput {
        
        print("call function")
        
        let recipes = try await httpClient.loadRecipes().prefix(3)
        let recipeDescriptions = recipes.map { recipe in
            "- \(recipe.name): \(recipe.description)"
        }.joined(separator: "\n\n")
        
        return ToolOutput(recipeDescriptions)
    }
}

