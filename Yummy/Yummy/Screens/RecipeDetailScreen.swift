//
//  RecipeDetailScreen.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/22/25.
//

import SwiftUI
import FoundationModels

struct RecipeDetailScreen: View {
    
    @Environment(RecipeRecommender.self) private var recipeRecommender
    let recipe: Recipe.PartiallyGenerated
    
    private func loadRecipeSteps() async {
        do {
            
            guard let recipeName = recipe.name else { return }
            
            try await recipeRecommender.createRecipeSteps(recipeName: recipeName)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        
        Group {
            if recipeRecommender.recipeSteps.isEmpty {
                ProgressView("Just a few more seconds...")
            } else {
                List(recipeRecommender.recipeSteps) { step in
                    HStack {
                        if let order = step.order {
                            Text("\(order)")
                                .padding()
                                .foregroundStyle(.white)
                                .background(.blue)
                                .clipShape(Circle())
                        }
                        if let instruction = step.instruction {
                            Text(instruction)
                        }
                    }
                }
            }
        }.task {
            await loadRecipeSteps()
        }
        .navigationTitle(recipe.name ?? "")
    }
}

#Preview {
    NavigationStack {
        RecipeDetailScreen(recipe: Recipe.sample.asPartiallyGenerated())
    }.environment(RecipeRecommender(httpClient: HTTPClient()))
}
