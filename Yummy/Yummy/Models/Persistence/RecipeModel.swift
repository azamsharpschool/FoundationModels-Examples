//
//  RecipeModel.swift
//  Yummy
//
//  Created by Mohammad Azam on 6/15/25.
//

import Foundation
import SwiftData

@Model
class RecipeModel {
    var name: String
    var desc: String
    
    init(name: String, desc: String) {
        self.name = name
        self.desc = desc
    }
}
