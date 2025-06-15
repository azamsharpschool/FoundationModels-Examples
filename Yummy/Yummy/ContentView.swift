//
//  ContentView.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIngredients: Set<Ingredient> = []
    @State private var showPresentRecipe: Bool = false
    @State private var navigateToIngredients: Set<Ingredient>? = nil
    
    var body: some View {
        VStack {
            IngredientSelectorView(selectedIngredients: $selectedIngredients)
            
            HStack {
                Button("Clear") {
                    selectedIngredients = []
                }.buttonStyle(.bordered)
                Button("Suggest Recipes") {
                    navigateToIngredients = selectedIngredients
                }.buttonStyle(.borderedProminent)
            }
        }
        .navigationDestination(item: $navigateToIngredients) { ingredients in
            RecipeListScreen(ingredients: ingredients)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
