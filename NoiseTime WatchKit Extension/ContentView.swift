//
//  ContentView.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 2/21/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        VStack {
            if audioRecorder.recording == false {
                Button("Start Recording") {
                    print("Start recording")
                    audioRecorder.startRecording()
                }
            } else {
                Button("Stop recording") {
                    print("Stop recording")
                    audioRecorder.stopRecording()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
