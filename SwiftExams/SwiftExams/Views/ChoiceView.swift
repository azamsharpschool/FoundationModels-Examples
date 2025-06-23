//
//  ChoiceView.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import SwiftUI
import FoundationModels

struct ChoiceView: View {
    
    let choice: Choice.PartiallyGenerated
    let onSelect: (Choice.PartiallyGenerated) -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .onTapGesture {
                    onSelect(choice)
                }
            Text(choice.text ?? "")
        }
    }
}

#Preview {
    ChoiceView(choice: Choice(text: "Choice text", isCorrect: true).asPartiallyGenerated(), onSelect: { _ in })
}
