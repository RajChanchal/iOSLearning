//
//  ContentView.swift
//  ColorPicker
//
//  Created by Chanchal Raj on 16/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = 0.0
    @State private var greenValue = 0.0
    @State private var blueValue = 0.0
    @State private var activeColor: Color = .gray
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 300, height: 200)
                .foregroundStyle(activeColor)
                .padding(.bottom, 24)
            Text("Red")
            HStack {
                Slider(value: $redValue, in: 0.0...255.0)
                    .tint(.red)
            }
            
            Text("Green")
            HStack {
                Slider(value: $greenValue, in: 0.0...255.0)
                    .tint(.green)
            }
            Text("Blue")
            HStack {
                Slider(value: $blueValue, in: 0.0...255.0)
                    .tint(.blue)
            }
            
            Button("Set Colors") {
                activeColor = Color(red: redValue / 255.0,
                                    green: greenValue / 255.0,
                                    blue: blueValue / 255.0)
            }
            .buttonStyle(.borderedProminent)
            .padding(16)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
