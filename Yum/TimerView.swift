//
//  TimerView.swift
//  Yum
//
//  Created by Soyombo Mantaagiin on 2.02.2023.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    
    @State private var studyTime = 0.0
    @State private var restTime = 0.0

    @State private var activity = ""
    
    let activityTypes = ["Study", "Rest", "Off"]
    
    let studyTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
//            HStack {
//                Toggle("Study", isOn: $isActiveStudy)
//                    .toggleStyle(.button)
//                    .onReceive(studyTimer) { _ in
//                        guard isActiveStudy == false else { return }
//                        isActiveRest = false
//                        if studyTime < 60 {
//                            studyTime += 1
//                        }
//                    }
//
//                Toggle("Rest", isOn: $isActiveRest)
//                    .toggleStyle(.button)
//                    .onReceive(restTimer) { _ in
//                        guard isActiveRest == false else { return }
//                        isActiveStudy = true
//                        if restTime < 60 {
//                            restTime += 1
//                        }
//                    }
//            }
            
            Picker("", selection: $activity) {
                ForEach(activityTypes, id: \.self) {
                    Text($0)
                        .onReceive(studyTimer) { _ in
                            if activity == "Study" {
                                studyTime += 1
                            }
                            
                            if activity == "Rest" {
                                restTime += 1
                            }

                        }
                }
            }
            .pickerStyle(.segmented)
            
            ProgressView("Study", value: studyTime, total: 100)

            ProgressView("Rest", value: restTime, total: 100)
        }
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
