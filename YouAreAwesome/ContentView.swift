//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Gabe Witcher on 3/3/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    
    let numberOfImages = 10
    let numberOfSounds = 6
    
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration:0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                                audioPlayer.stop()
                        }
                    }
                    .tint(.blue)
                
                
                Spacer()
                
                
                Button("Show Message", action: {
                    let messages = ["Pilar?", "Bulk of the Series", "This is what happens", "Do you see what happens, Larry?", "This is what happens when you meet a stranger in the alps???"]
                    
                    lastImageNumber =  nonrepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages - 1 )
                    imageName = "image\(lastImageNumber)"
                    
                    lastMessageNumber = nonrepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count - 1)
                    message = messages[(lastMessageNumber)]
                    lastSoundNumber = nonrepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds - 1)
                    
                    if soundIsOn {
                       
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                    
                })
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .fontWeight(.bold)
            }
            
        }
        
        .padding()
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not load file \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioplayer")
        }
    }
    
    func nonrepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBounds)
        }  while newNumber == lastNumber
        return newNumber
    }
    
}

#Preview("Light Mode"){
    ContentView()
        .preferredColorScheme(.light)
}
#Preview("Dark Mode"){
    ContentView()
        .preferredColorScheme(.dark)
}

