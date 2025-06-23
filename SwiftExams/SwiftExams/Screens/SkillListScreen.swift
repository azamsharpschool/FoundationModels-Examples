//
//  SkillListScreen.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import Foundation
import SwiftUI

struct SkillListScreen: View {
    var body: some View {
        NavigationView {
            List(SkillLevel.allCases) { level in
                
                NavigationLink {
                    ExamScreen(skillLevel: level)
                } label: {
                    HStack(spacing: 16) {
                        Image(systemName: level.iconName)
                            .foregroundColor(level.color)
                            .font(.system(size: 24))
                            .frame(width: 32, height: 32)

                        Text(level.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.vertical, 8)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Swift Skill Levels")
        }
    }
}

#Preview {
    NavigationStack {
        SkillListScreen()
    }
}

