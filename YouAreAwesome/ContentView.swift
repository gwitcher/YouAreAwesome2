//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Gabe Witcher on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I am a Developer!"
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(Color.red)
            Button("Click Me!") {
                if message == "I am a Developer!" {
                    message = "Awesome!"
                } else {
                    message = "I am a Developer!"
                }
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
