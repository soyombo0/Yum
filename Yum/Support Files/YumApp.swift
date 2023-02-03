//
//  YumApp.swift
//  Yum
//
//  Created by Soyombo Mantaagiin on 2.02.2023.
//

import SwiftUI

@main
struct YumApp: App {
    
    @State private var currentNumber = "1"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        MenuBarExtra(currentNumber, systemImage: "timer.circle") {
            Button("One") {
                currentNumber = "1"
            }
            .keyboardShortcut("1")
            
            Button("Two") {
                currentNumber = "2"
            }
            .keyboardShortcut("2")
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
    }
}

