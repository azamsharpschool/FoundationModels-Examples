//
//  RecipeView.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import SwiftUI
import FoundationModels

struct RecipeListScreen: View {
    
    let ingredients: Set<Ingredient>
    @State private var recipeRecommender: RecipeRecommender?
    
    private func saveRecipeAsFavorite(recipe: Recipe.PartiallyGenerated) {
        
        guard let name = recipe.name,
              let description = recipe.description else { return }
        
        
        let recipeModel = RecipeModel(name: name, desc: description)
        
        // save the recipe model 
        
    }
    
    var body: some View {
        
        Group {
            if let recommender = recipeRecommender {
                if !recommender.recipes.isEmpty {
                    RecipeListView(recipes: recommender.recipes, onSaveAsFavorite: saveRecipeAsFavorite)
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
    let onSaveAsFavorite: (Recipe.PartiallyGenerated) -> Void
    
    var body: some View {
        List(recipes) { recipe in
            RecipeCellView(recipe: recipe, onSaveAsFavorite: onSaveAsFavorite)
        }
    }
}

struct RecipeCellView: View {
    
    let recipe: Recipe.PartiallyGenerated
    let onSaveAsFavorite: (Recipe.PartiallyGenerated) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            if let name = recipe.name {
                Text(name)
                    .font(.headline)
                    .contentTransition(.opacity)
            }
            
            if let description = recipe.description {
                Text(description)
            }
            
            Button("Save as favorite") {
                onSaveAsFavorite(recipe)
            }
            .buttonStyle(.bordered)
        }
    }
}


#Preview {
    RecipeListScreen(ingredients: Ingredient.preview)
}
