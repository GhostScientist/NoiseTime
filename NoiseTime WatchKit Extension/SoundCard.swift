//
//  SoundCard.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 2/21/21.
//

import SwiftUI

struct SoundCard: View {
    var body: some View {
        Button(action: {
            print("Button clicked")
        }) {
            HStack {
                Spacer()
                Image(systemName: "waveform")
                Text("Click me!")
                Spacer()
            }.foregroundColor(.black)
        }.frame(height: 50.0).background(Image( "lemongrab")).cornerRadius(7.50)
    }
}

struct SoundCard_Previews: PreviewProvider {
    static var previews: some View {
        SoundCard()
    }
}
