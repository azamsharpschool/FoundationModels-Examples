//
//  ContentView.swift
//  Jokes
//
//  Created by Mohammad Azam on 6/13/25.
//

import SwiftUI
import FoundationModels
import Observation

struct DadJokesTool: Tool {
    
    // this is a test!
    var name: String = "dadJokesTool"
    var description: String = "Generate classic dad jokes that are punny, clean, and perfect for lightening the mood. Great for family-friendly humor on any topic."
    
    @Generable
    struct Arguments {
        @Guide(description: "A natural language topic or keyword to base the dad joke on, such as 'bicycles', 'pizza', or 'coding'.")
        let naturalLanguageQuery: String
    }
    
    func call(arguments: Arguments) async throws -> ToolOutput {
        let randomJoke = randomDadJoke()
        return ToolOutput(randomJoke)
    }
    
    private func randomDadJoke() -> String {
        let jokes = [
            "I'm reading a book on anti-gravity. It's impossible to put down!",
            "Why don't skeletons fight each other? They don't have the guts.",
            "I only know 25 letters of the alphabet. I don't know y.",
            "Did you hear about the restaurant on the moon? Great food, no atmosphere.",
            "Why did the scarecrow win an award? Because he was outstanding in his field!"
        ]
        
        return jokes.randomElement() ?? "I'm all out of jokes... for now!"
    }

}

@Generable
struct Joke {
    let text: String
}

@MainActor
@Observable
class JokeMaker {
    
    let session: LanguageModelSession
    private(set) var joke: Joke.PartiallyGenerated?
    let dadJokesTool = DadJokesTool()
    
    init() {
        self.session = LanguageModelSession(tools: [dadJokesTool]) {
                """
                You are a professional joke writer. Your task is to generate short, clever, and family-friendly jokes on request. Keep the tone light and playful.
                """
        }
    }
    
    func suggestJoke() async throws {
        
        let prompt = "Tell me a short, clever, and family-friendly joke about programmers."
        
        let stream = session.streamResponse(to: prompt, generating: Joke.self)
        
        for try await partial in stream {
            self.joke = partial
        }
    }
}

struct ContentView: View {
    
    @State private var jokeMaker: JokeMaker?
    
    var body: some View {
        VStack {
            
            Button("Display a joke") {
                Task {
                    try await jokeMaker?.suggestJoke()
                }
            }.disabled(jokeMaker?.session.isResponding ?? true)
            .buttonStyle(.bordered)
            .glassEffect()
            
            if let joke = jokeMaker?.joke {
                if let text = joke.text {
                    Text(text)
                }
            }
            
        }
        .padding()
        .task {
            jokeMaker = JokeMaker()
        }
    }
}

#Preview {
    ContentView()
}
