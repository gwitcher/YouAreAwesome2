//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Gabe Witcher on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    
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
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            
            Spacer()
            
            Button("Show Message", action: {
                let messages = ["Pilar?", "Bulk of the Series", "This is what happens", "Do you see what happens, Larry?", "This is what happens when you meet a stranger in the alps???"]
                var imageNumber = Int.random(in: 0...9)
                var messageNumber = Int.random(in: 0...messages.count - 1)
                
               
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                   
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...messages.count - 1)
                }
                message = messages[(messageNumber)]
                lastMessageNumber = messageNumber
  
                
                
            })
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .fontWeight(.bold)
            
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
