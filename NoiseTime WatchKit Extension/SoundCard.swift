//
//  SoundCard.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 2/21/21.
//

import SwiftUI
import AVFoundation

struct AudioFile: Identifiable {
    let id = UUID()
    let fileName: String
}

var audioPlayer: AVAudioPlayer?

struct SoundCard: View {
    private var file: AudioFile
    
    init(_ audioFileName: String) {
        file = AudioFile(fileName: audioFileName)
    }
    
    func playAudio() {
        guard let path = Bundle.main.path(forResource: file.fileName, ofType:
            "mp3") else { print("No file found!")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error loading audio file...")
        }
    }
    var body: some View {
        Button(action: {
            playAudio()
        }) {
            HStack {
                Spacer()
                Image(systemName: "waveform")
                Text(file.fileName)
                Spacer()
            }.foregroundColor(.black)
        }.frame(height: 50.0).background(Image( "lemongrab")).cornerRadius(7.50)
    }
}

struct SoundCard_Previews: PreviewProvider {
    static var previews: some View {
        SoundCard("okay")
    }
}
