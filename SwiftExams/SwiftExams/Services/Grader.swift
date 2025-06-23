//
//  Grader.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import Foundation
import FoundationModels

struct Grader {
    
    static func grade(examKey: Exam.PartiallyGenerated, studentSubmission: [GenerationID: GenerationID]) -> Int {
        var score = 0
        
        guard let questions = examKey.questions else {
            return 0
        }
        
        for question in questions {
            // Safely unwrap choices and find the correct one
            guard let choices = question.choices,
                  let correctChoice = choices.first(where: { $0.isCorrect == true }) else {
                continue
            }
            
            if studentSubmission[question.id] == correctChoice.id {
                score += question.point ?? 0
            }
        }
        
        return score
    }
}




