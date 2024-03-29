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
        let recordingSession = AVAudioSession()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            
            let fileManager = FileManager.default
            let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
            let audioFilename = documentsUrl.first!.appendingPathComponent("recorded_audio.m4a")
            
            let audioFormat = AVAudioFormat(commonFormat: .pcmFormatFloat32, sampleRate: 44100, channels: 2, interleaved: false)!
            
            audioRecorder = try AVAudioRecorder(url: audioFilename, format: audioFormat)
            audioRecorder.record()
            recording = true
            
        } catch {
            print("Failed to set up a recording session.")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
    }
    
    func fetchRecordings() {
        
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
