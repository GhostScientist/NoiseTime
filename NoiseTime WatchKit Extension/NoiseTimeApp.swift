//
//  NoiseTimeApp.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 2/21/21.
//

import SwiftUI

@main
struct NoiseTimeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(audioRecorder: AudioRecorder())
            }
        }
    }
}
