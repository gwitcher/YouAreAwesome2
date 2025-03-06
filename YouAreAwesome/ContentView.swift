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
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("image\(imageNumber)")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Show Message", action: {
                let messages = ["Hi!", "You are here", "This is what happens", "Do you see what happens, Larry?", "This is what happens when you meet a stranger in the alps"]
   
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
                message = messages[messageNumber]
                messageNumber += 1
                
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
               // message = (message == message1 ? message2 : message1 )
                //imageName = (imageName == imageString1 ? imageString2 : imageString1)
                
                
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
