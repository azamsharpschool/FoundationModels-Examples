//
//  ExamScreen.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import SwiftUI
import FoundationModels

struct ExamScreen: View {
    
    let skillLevel: SkillLevel
    @State private var examGenerator: ExamGenerator?
    @State private var selectedChoices: [GenerationID: GenerationID] = [: ]
    @State private var score: Int?
    
    private func generateExamQuestions() async {
        do {
            examGenerator = ExamGenerator()
            try await examGenerator?.generate(skillLevel: skillLevel)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func isUserChoice(questionId: GenerationID, choiceId: GenerationID) -> Bool {
        
        
        
        false
    }
    
    var body: some View {
        
        let exam = examGenerator?.exam
        
        Group {
            if let exam {
                List {
                    if let name = exam.name,
                       let description = exam.description
                    {
                        Text(name)
                            .font(.title)
                            
                        Text(description)
                    }
                    
                    ForEach(Array((exam.questions ?? []).enumerated()), id: \.element.id) { index, question in
                        
                        QuestionView(index: index, question: question, selectedChoiceId: selectedChoices[question.id] ?? .init(), onSelectChoice: { selectedChoiceId in
                            
                            selectedChoices[question.id] = selectedChoiceId
                            print(selectedChoices)
                        })
                        
                    }
                    
                }
            } else {
                ProgressView("Please wait...")
            }
        }
        .overlay {
            if let score {
                ScoreOverlayView(score: score) {
                    self.score = nil 
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                
                let questionCount = exam?.questions?.count ?? 0
                
                Button("Submit") {
                    
                    if let exam {
                      score =  Grader.grade(examKey: exam, studentSubmission: selectedChoices)
                    }
                }
                .disabled(selectedChoices.count != questionCount)
            }
        })
        .task {
            await generateExamQuestions()
        }
    }
}

#Preview {
    NavigationStack {
        ExamScreen(skillLevel: .beginner)
    }
}
