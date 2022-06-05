//
//  AudioRecorder.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 6/5/22.
//

import Foundation
import AVFoundation
import Combine

class AudioRecorder: ObservableObject {
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    
    var audioRecorder: AVAudioRecorder!
    
    
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func startRecording() {
        recording = true
    }
    
    func stopRecording() {
        recording = false
    }
    
    func fetchRecordings() {
        
    }
}
