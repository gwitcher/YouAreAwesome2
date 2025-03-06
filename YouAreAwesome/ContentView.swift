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
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Press Me", action: {
                let message1 = "You are Great!"
                let message2 = "You Are Awesome!"
                let imageString1 = "image0"
                let imageString2 = "image1"
                
                message = (message == message1 ? message2 : message1 )
                imageName = (imageName == imageString1 ? imageString2 : imageString1)
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
