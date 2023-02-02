//
//  TimerView.swift
//  Yum
//
//  Created by Soyombo Mantaagiin on 2.02.2023.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    // MARK: - properties
    @State private var studyTime = 0.0
    @State private var restTime = 0.0
    @State private var activity = "Off"
    @State private var estimatedStudy = 100.0
    @State private var estimatedRest = 100.0
    
    let activityTypes = ["Study", "Rest"]
    
    let studyTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let animView = LottieView()
    
    // MARK: - Timer View
    var body: some View {
        VStack {
            
            Picker("", selection: $activity) {
                ForEach(activityTypes, id: \.self) {
                    Text($0)
                        .onReceive(studyTimer) { _ in
                            if activity == "Study" && studyTime < estimatedStudy {
                                studyTime += 1
                            }
                            if activity == "Rest" && restTime < estimatedRest {
                                restTime += 1
                            }
                        }
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                Button {
                    studyTime = 0
                    restTime = 0
                    activity = ""
                } label: {
                    Image(systemName: "repeat")
                }
                
                Button {
                    activity = ""
                } label: {
                    Image(systemName: "pause.fill")
                }
            }
            
            ProgressView("Study", value: studyTime, total: estimatedStudy)
                    
            ProgressView("Rest", value: restTime, total: estimatedRest)
                
            
        }
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
