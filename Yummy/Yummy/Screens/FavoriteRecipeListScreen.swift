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
            ContentUnavailableView("No Favorite Recipes",
                                       systemImage: "heart.slash",
                                       description: Text("You haven't added any recipes to your favorites yet."))
        } else {
            List(recipeModels) { recipeModel in
                VStack(alignment: .leading) {
                    Text(recipeModel.name)
                        .font(.headline)
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
