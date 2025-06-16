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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .modelContainer(for: RecipeModel.self)
        }
    }
}
