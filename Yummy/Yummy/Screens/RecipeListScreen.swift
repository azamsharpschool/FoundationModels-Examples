//
//  RecipeView.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import SwiftUI
import FoundationModels
import SwiftData

struct RecipeListScreen: View {
    
    let ingredients: Set<Ingredient>
    @Environment(RecipeRecommender.self) private var recipeRecommender
    @Environment(\.modelContext) private var modelContext
    @Environment(\.httpClient) private var httpClient
    
    private func saveRecipeAsFavorite(recipeModel: RecipeModel) {
        
        print(recipeModel.name)
        print(recipeModel.desc)
        
        // save the recipe Model
        modelContext.insert(recipeModel)
    }
    
    var body: some View {
        
        let recipes = recipeRecommender.recipes
        
        Group {
            
            if !recipes.isEmpty {
                List(recipes) { recipe in
                    NavigationLink {
                        RecipeDetailScreen(recipe: recipe)
                    } label: {
                        RecipeCellView(recipe: recipe, onSaveAsFavorite: saveRecipeAsFavorite)
                    }
                }
            } else {
                ProgressView("Preparing delicious recipes")
            }
            
        }.task {
            do {
                
                try await recipeRecommender.suggestRecipes(ingredients: ingredients)
            } catch {
                print(error)
            }
        }
    }
}

struct RecipeListView: View {
    
    let recipes: [Recipe.PartiallyGenerated]
    let onSaveAsFavorite: (RecipeModel) -> Void
    
    var body: some View {
        List(recipes) { recipe in
            RecipeCellView(recipe: recipe, onSaveAsFavorite: onSaveAsFavorite)
        }
    }
}

struct RecipeCellView: View {
    
    let recipe: Recipe.PartiallyGenerated
    let onSaveAsFavorite: (RecipeModel) -> Void
    
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
            
            Button("Save to favorite") {
                
                guard let name = recipe.name,
                      let description = recipe.description else { return }
                
                // create a SwiftData model
                let recipeModel = RecipeModel(name: name, desc: description)
                
                onSaveAsFavorite(recipeModel)
            }
            .buttonStyle(.bordered)
        }
    }
}


#Preview {
    NavigationStack {
        RecipeListScreen(ingredients: Ingredient.preview)
    } .modelContainer(previewContainer)
}
