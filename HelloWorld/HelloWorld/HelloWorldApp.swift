//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by Mohammad Azam on 6/9/25.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Summarizer())
                .withToast()
        }
    }
}
