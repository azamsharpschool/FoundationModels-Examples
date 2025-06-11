//
//  ContentView.swift
//  HelloWorld
//
//  Created by Mohammad Azam on 6/9/25.
//

import Playgrounds
import SwiftUI
import FoundationModels

struct ContentView: View {
    
    @State private var transcript: String = ""
    @Environment(Summarizer.self) private var summarizer
    
    private func loadTranscript() -> String {
        guard let url = Bundle.main.url(forResource: "transcript", withExtension: "txt") else {
            print("Transcript file not found.")
            return ""
        }

        do {
            let contents = try String(contentsOf: url, encoding: .utf8)
            return contents
        } catch {
            print("Failed to load transcript: \(error)")
            return ""
        }
    }

    var body: some View {
        VStack {
            ScrollView {
                if summarizer.summarizedText.isEmpty {
                    Text(transcript)
                } else {
                    Text(summarizer.summarizedText)
                }
            }
            
            Button {
                Task { try await summarizer.summarize(text: transcript) }
            } label: {
                HStack {
                    if summarizer.isSummarizing {
                        ProgressView()
                    }
                    Text(summarizer.isSummarizing ? "Summarizing...": "Summarize Text")
                }
            }.buttonStyle(.bordered)
                .glassEffect()
                .disabled(summarizer.isSummarizing)
        }
        
        .padding()
        .onAppear(perform: {
            transcript = loadTranscript()
        })
        .padding()
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
    .environment(Summarizer())
    
}
