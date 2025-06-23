//
//  ExamQuestionGenerator.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import FoundationModels
import Observation

@Observable
@MainActor
class ExamGenerator {
    
    var exam: Exam.PartiallyGenerated?
    var session: LanguageModelSession

    init() {
        self.session = LanguageModelSession() {
            """
            You are responsible for creating an exam. Each exam will consist of questions. Each question will have 4 choices, where one of them will be correct.    
            """
            
            "Here is an example of sample exam:"
            
            Exam.sampleExam
        }
    }
    
    func generate(skillLevel: SkillLevel) async throws {
        
        let prompt = "Create a \(skillLevel.title.lowercased())-level Swift programming exam"
        
        let stream = session.streamResponse(to: prompt, generating: Exam.self)
        
        for try await partialResponse in stream {
            exam = partialResponse
        }
    }
}
