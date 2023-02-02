//
//  ContentView.swift
//  Yum
//
//  Created by Soyombo Mantaagiin on 2.02.2023.
//

import SwiftUI
struct ContentView: View {
    
    // MARK: - Main View; Entry point of app
    
    var body: some View {
        
        VStack() {
            LottieView(loopMode: .loop, autostart: true, contentMode: .scaleAspectFit)
            
            TimerView()
        }
        .padding()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
