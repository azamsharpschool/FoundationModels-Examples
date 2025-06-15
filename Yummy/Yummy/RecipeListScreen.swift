//
//  RecipeView.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import SwiftUI

struct RecipeListScreen: View {
    
    let ingredients: Set<Ingredient>
    @State private var recipeRecommender: RecipeRecommender?
    
    var body: some View {
        
        Group {
            if let recommender = recipeRecommender {
                if !recommender.recipes.isEmpty {
                    RecipeListView(recipes: recommender.recipes)
                        .transition(.blurReplace)
                } else {
                    ProgressView("Preparing delicious recipes...")
                }
            } else {
                ProgressView("Preparing delicious recipes...")
            }
        }.task {
            do {
                recipeRecommender = RecipeRecommender()
                // get suggestions
                try await recipeRecommender?.suggestRecipes(ingredients: ingredients)
            } catch {
                print(error)
            }
        }
        
        
    }
}

struct RecipeListView: View {
    
    let recipes: [Recipe.PartiallyGenerated]
    
    var body: some View {
        List(recipes) { recipe in
            VStack(alignment: .leading) {
                if let name = recipe.name {
                    Text(name)
                        .font(.headline)
                        .contentTransition(.opacity)
                }
                
                if let description = recipe.description {
                    Text(description)
                }
            }
        }
    }
}

#Preview {
    RecipeListScreen(ingredients: Ingredient.preview)
}
