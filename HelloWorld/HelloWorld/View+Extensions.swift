//
//  View+Extensions.swift
//  Platzi
//
//  Created by Mohammad Azam on 6/8/25.
//

import Foundation
import SwiftUI

extension View {
    func priceTag() -> some View {
        self
            .font(.caption2)
            .padding(6)
            .background(Color.green)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .listRowSeparator(.hidden)
    }
    
    
    func withToast() -> some View {
        modifier(ToastModifier())
    }
    
}
