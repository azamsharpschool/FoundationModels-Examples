//
//  ToastView.swift
//  Platzi
//
//  Created by Mohammad Azam on 6/8/25.
//

import SwiftUI

struct ShowToastAction {
    typealias Action = (ToastType) -> Void
    let action: Action
    
    func callAsFunction(_ type: ToastType) {
        action(type)
    }
}

enum ToastType {
    case success(String)
    case error(String)
    case info(String)
    
    var backgroundColor: Color {
        switch self {
            case .success:
                return Color.green.opacity(1.0)
            case .error:
                return Color.red.opacity(1.0)
            case .info:
                return Color.blue.opacity(1.0)
        }
    }
    
    var icon: Image {
        switch self {
            case .success:
                return Image(systemName: "checkmark.circle")
            case .error:
                return Image(systemName: "xmark.octagon")
            case .info:
                return Image(systemName: "info.circle")
        }
    }
    
    var message: String {
        switch self {
            case .success(let msg), .error(let msg), .info(let msg):
                return msg
        }
    }
    
}

struct ToastView: View {
    
    let type: ToastType
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            type.icon
                .foregroundStyle(.white)
            Text(type.message)
                .foregroundColor(.white)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }  .padding()
            .background(type.backgroundColor)
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding(.horizontal, 16)
           
    }
}

struct ToastModifier: ViewModifier {
    
    @State private var type: ToastType?
    @State private var dismissTask: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .environment(\.showToast, ShowToastAction(action: { type in
                withAnimation(.easeInOut) {
                    self.type = type
                }
                
                // cancel previous dismissal task if any
                dismissTask?.cancel()
                
                // schedule a new dismisal
                let task = DispatchWorkItem {
                    withAnimation(.easeInOut) {
                        self.type = nil
                    }
                }
                
                self.dismissTask = task
                //DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: task)
                
            }))
            .overlay(alignment: .bottom) {
                if let type {
                    ToastView(type: type)
                        .transition(.move(edge: .bottom))
                        .padding(.top, 50)
                }
            }
    }
}

#Preview {
    ToastView(type: .success("Customer saved."))
    ToastView(type: .error("Operation failed."))
    ToastView(type: .info("Informational message."))
}
