//
//  ScoreOverlayView.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import SwiftUI

struct ScoreOverlayView: View {
    let score: Int
    let onClose: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("🎉 Exam Complete")
                .font(.title.bold())

            Text("Your Score: \(score)")
                .font(.title2)
                .padding(.bottom, 12)

            Button("Close") {
                onClose()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding(32)
    }
}

#Preview {
    
    ScoreOverlayView(score: 85) {
        // Preview close handler — no action needed}
    }
}
