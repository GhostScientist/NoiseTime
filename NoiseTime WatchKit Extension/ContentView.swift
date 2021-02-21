//
//  ContentView.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 2/21/21.
//

import SwiftUI

struct ContentView: View {
    let audioList = ["okay", "okay1", "okay2",
    "okay3", "okay4"]
    var body: some View {
        List(audioList, id: \.self) { fileName in
                    SoundCard(fileName)
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
