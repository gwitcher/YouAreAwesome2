//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Gabe Witcher on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programmer!"
    
    var body: some View {
       
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.orange)
                .frame(width: 200, height: 200)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
         
            HStack {
                
                Button("Awesome", action: {
                    message = "Awesome"
                })
                
                Button("Great", action: {
                    message = "Great"
                })
            }
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
