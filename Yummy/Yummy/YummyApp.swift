//
//  YummyApp.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/14/25.
//

import SwiftUI
import SwiftData

@main
struct YummyApp: App {
    
    @State private var recipeRecommender = RecipeRecommender(httpClient: HTTPClient())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .modelContainer(for: RecipeModel.self)
            .environment(recipeRecommender)
        }
    }
}
