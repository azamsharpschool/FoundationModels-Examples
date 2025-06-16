//
//  PreviewContainer.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/15/25.
//

import Foundation
import SwiftData

var previewContainer: ModelContainer = {
    try! ModelContainer(for: RecipeModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
}()
