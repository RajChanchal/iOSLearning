//
//  ContentView.swift
//  ColorPicker
//
//  Created by Chanchal Raj on 16/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State var selectedAge = 25.0
    var body: some View {
        VStack {
            Image("driving")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Select Cat Age")
                .font(.largeTitle)
                .padding()
                .background(.green)
            Text(selectedAge, format: .number.precision(.fractionLength(0)))
                .bold()
                .font(.title)
                .foregroundStyle(.orange)
            Slider(value: $selectedAge, in: 0...255)
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
