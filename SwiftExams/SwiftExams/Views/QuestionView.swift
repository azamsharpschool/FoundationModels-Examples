//
//  QuestionView.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import SwiftUI
import FoundationModels

struct QuestionView: View {
    
    let index: Int
    let question: Question.PartiallyGenerated
    let selectedChoiceId: GenerationID
    let onSelectChoice: (GenerationID) -> Void
    
    var body: some View {
        VStack {
            if let questionText = question.text {
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1)")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                        .background(Color.blue)
                        .clipShape(Circle())
                    
                    Text(questionText)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 4)
            }
            
            if let choices = question.choices {
                ForEach(choices) { choice in
                    HStack {
                        Image(systemName: selectedChoiceId == choice.id ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(.blue)
                        if let choiceText = choice.text {
                            Text(choiceText)
                        }
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onSelectChoice(choice.id)
                    }
                }
            }
            
        }
    }
}

#Preview {
    QuestionView(index: 1, question: Question(text: "What is 2+2?", point: 10, choices: []).asPartiallyGenerated(), selectedChoiceId: .init(), onSelectChoice: { _ in })
}
