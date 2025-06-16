//
//  HTTPClient.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/16/25.
//

import Foundation

struct HTTPClient {
    
    func loadRecipes() async throws -> [RecipeDTO] {
        print("loadRecipes")
        let (data, _) = try await URLSession.shared.data(from: Constants.Urls.recipes)
        return try JSONDecoder().decode([RecipeDTO].self, from: data)
    }
    
}
