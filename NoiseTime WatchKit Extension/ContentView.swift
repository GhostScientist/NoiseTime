//
//  ContentView.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 2/21/21.
//

import SwiftUI
import Combine
import AVFoundation

struct RecordButton: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    @State var player: AVAudioPlayer!
    
    init(audioRecorder: AudioRecorder) {
        self.audioRecorder = audioRecorder
    }
    
    var body: some View {
        Button(action: {
            audioRecorder.recording == true ? audioRecorder.stopRecording() :
            audioRecorder.startRecording()
        }) {
            if (audioRecorder.recording) {
                Image(systemName: "stop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipped()
                    .foregroundColor(.red)
            } else {
                Image(systemName: "circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipped()
                    .foregroundColor(.red)
            }
        }
        Button {
            let fileManager = FileManager.default
            let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
            let soundFileUrl = documentsUrl.first!.appendingPathComponent("recorded_audio.m4a")

            do {
                player = try AVAudioPlayer(contentsOf: soundFileUrl)
                player.prepareToPlay()
                player.play()
            } catch {
                print("Error loading audio file: \(error)")
            }
        } label: {
            Text("Play")
        }

    }
    
}

struct ContentView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        NavigationView {
            VStack {
                RecordButton(audioRecorder: audioRecorder)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
