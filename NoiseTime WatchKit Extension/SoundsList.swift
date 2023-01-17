//
//  SoundsList.swift
//  NoiseTime WatchKit Extension
//
//  Created by Dakota Kim on 6/5/22.
//

import SwiftUI

struct SoundsList: View {
    let audioList = ["Welcome, Lemongrab", "Bye", "I am royal",
                     "I'll be taking a nap", "Make yourself into food", "My vital juices!", "Only one", "Rigmarole",
                     "Seedwad", "Stop Screaming!", "Unacceptable", "We've have it all", "Brother, stop that!"]
    
    var body: some View {
        VStack {
            HStack {
                Text("NoiseTime")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            List(audioList, id: \.self) { (fileName) in
                SoundCard(fileName)
            }.listStyle(CarouselListStyle())
        }
    }
}


struct SoundsList_Previews: PreviewProvider {
    static var previews: some View {
        SoundsList()
    }
}
