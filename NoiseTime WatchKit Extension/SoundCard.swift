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
    
    let imageList = ["lemongrab", "lemongrab2", "lemongrab3", "lemongrab4", "lemongrab5", "lemongrab6", "lemongrab7"]
    
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
                Text(file.fileName).background(Color.white).cornerRadius(7.50)
                Spacer()
            }.foregroundColor(.black)
            .font(.system(size: 17.0, weight: .heavy, design: .monospaced))
        }
        .frame(height: 50.0)
        .background(Image(imageList[Int.random(in: 0..<imageList.count)])
                        .resizable()
                        .frame(height: 50.0).aspectRatio(contentMode: .fit)).cornerRadius(7.50)
    }
}

struct SoundCard_Previews: PreviewProvider {
    static var previews: some View {
        SoundCard("okay")
    }
}
