//
//  ContentView.swift
//  ColorPicker
//
//  Created by Chanchal Raj on 16/12/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("driving")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Select Cat Age")
                .font(.largeTitle)
                .padding()
                .background(.green)
            Text("100")
                .bold()
                .font(.title)
                .foregroundStyle(.orange)
            Slider(value: .constant(100), in: 0...255)
                .tint(.green)
                .padding()
            Button("Next"){
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
