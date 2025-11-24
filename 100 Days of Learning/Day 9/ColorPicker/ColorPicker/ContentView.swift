//
//  ContentView.swift
//  ColorPicker
//
//  Created by Chanchal Raj on 24/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedAge: Double = 100
    @State private var clickButtonTitle: String = "Click Me"
    var body: some View {
        VStack {
            Image("hqdefault")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Select Cat Age")
                .font(.largeTitle)
                .padding()
                .background(.green)
            Text(selectedAge, format: .number.precision(.fractionLength(0)))
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.orange)
            Slider(value: $selectedAge, in: 0...255)
                .tint(.green)
                .padding()
            Button(action: {
                print("I am clicked")
                clickButtonTitle = "Clicked"
            }) {
                Text(clickButtonTitle)
            }
            .font(.title)
            .padding()
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.capsule)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
