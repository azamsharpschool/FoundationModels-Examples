//
//  Summarizer.swift
//  HelloWorld
//
//  Created by Mohammad Azam on 6/11/25.
//

import Foundation
import FoundationModels
import Observation

@MainActor
@Observable
class Summarizer {
    
    let session: LanguageModelSession
    var summarizedText: String = ""
    var isSummarizing: Bool = false
    
    init() {
        session = LanguageModelSession(instructions: "You are a text summarizer. Your job is to summarize the text provided to you in 5 lines or less")
    }
    
    func summarize(text: String) async throws {
        
        let prompt = "Summarize the following text \n \(text)"
        let stream = session.streamResponse(to: prompt)
        
        print("Summarization begins!")
        isSummarizing = true
        
        for try await partial in stream {
            summarizedText = partial
        }
        
        print("Summarization completed!")
        isSummarizing = false 
    }
}
