//
//  SkillLevel.swift
//  SwiftExams
//
//  Created by Mohammad Azam on 6/22/25.
//

import Foundation
import SwiftUI 

enum SkillLevel: CaseIterable, Identifiable {
    case beginner
    case intermediate
    case advanced
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .beginner: return "Beginner"
        case .intermediate: return "Intermediate"
        case .advanced: return "Advanced"
        }
    }
    
    var iconName: String {
        switch self {
        case .beginner: return "tortoise.fill"
        case .intermediate: return "bolt.fill"
        case .advanced: return "flame.fill"
        }
    }

    var color: Color {
        switch self {
        case .beginner: return .green
        case .intermediate: return .yellow
        case .advanced: return .red
        }
    }
}
