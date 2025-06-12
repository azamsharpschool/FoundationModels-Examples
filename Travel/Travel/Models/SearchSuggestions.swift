//
//  SearchSuggestions.swift
//  Travel
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation
import FoundationModels

@Generable
struct SearchSuggestions {
    @Guide(description: "A list of suggested batman movies.", .count(4))
    var searchTerms: [String]
}
