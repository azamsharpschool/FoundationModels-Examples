//
//  Question.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import Foundation
import FoundationModels

@Generable
struct Exam {
    
    @Guide(description: "The title of the exam.")
    let name: String

    @Guide(description: "A short description of what this exam covers.")
    let description: String

    @Guide(description: "A list of questions included in the exam.", .count(3))
    let questions: [Question]
}

@Generable
struct Question {
    
    let questionId: UUID = UUID()
    
    @Guide(description: "The text for the exam question.")
    let text: String

    @Guide(description: "The number of points this question is worth. Make sure it is 10.")
    let point: Int

    @Guide(description: "The answer choices for this question. One of them must be marked as correct.", .count(4))
    let choices: [Choice]
}

@Generable
struct Choice {
    
    // This property will NOT be part of partially generated type
    // The reason is that it has been initialized.
    let choiceId = UUID()
    
    @Guide(description: "The text displayed for this answer choice.")
    let text: String

    @Guide(description: "Indicates whether this choice is the correct answer.")
    let isCorrect: Bool
    
}


extension Exam {
    
    static let sampleExam = Exam(
        name: "Swift Fundamentals Exam",
        description: "A beginner-level exam to test knowledge of Swift basics including variables, optionals, and control flow.",
        questions: [
            Question(
                text: "Which keyword is used to declare a constant in Swift?",
                point: 5,
                choices: [
                    Choice(text: "var", isCorrect: false),
                    Choice(text: "let", isCorrect: true),
                    Choice(text: "const", isCorrect: false),
                    Choice(text: "define", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the default value of an optional if it is not assigned?",
                point: 5,
                choices: [
                    Choice(text: "nil", isCorrect: true),
                    Choice(text: "0", isCorrect: false),
                    Choice(text: "undefined", isCorrect: false),
                    Choice(text: "null", isCorrect: false)
                ]
            ),
            Question(
                text: "Which statement is used for conditional branching in Swift?",
                point: 5,
                choices: [
                    Choice(text: "if", isCorrect: true),
                    Choice(text: "when", isCorrect: false),
                    Choice(text: "case", isCorrect: false),
                    Choice(text: "switchif", isCorrect: false)
                ]
            )
        ]
    )

    
}
