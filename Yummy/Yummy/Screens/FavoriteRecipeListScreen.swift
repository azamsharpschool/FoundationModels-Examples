//
//  ShowFavoritesScreen.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/16/25.
//

import SwiftUI
import SwiftData

struct FavoriteRecipeListScreen: View {
    
    @Query private var recipeModels: [RecipeModel]
    
    var body: some View {
        
        if recipeModels.isEmpty {
            Text("No favorite recipes found.")
        } else {
            List(recipeModels) { recipeModel in
                VStack(alignment: .leading) {
                    Text(recipeModel.name)
                    Text(recipeModel.desc)
                }
            }.navigationTitle("Favorite Recipes")
        }
    }
}

#Preview {
    FavoriteRecipeListScreen()
        .modelContainer(previewContainer)
}
