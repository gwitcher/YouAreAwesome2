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
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.orange)
            //.frame(width: 200, height: 200)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press Me", action: {
                let message1 = "You are Great!"
                let message2 = "You Are Awesome!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                
                message = (message == message1 ? message2 : message1 )
                imageName = (imageName == imageString1 ? imageString2 : imageString1)
                    
                
                
            })
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .fontWeight(.bold)
            .tint(.orange)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
