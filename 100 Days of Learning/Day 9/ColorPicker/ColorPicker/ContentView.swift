//
//  ContentView.swift
//  ColorPicker
//
//  Created by Chanchal Raj on 24/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State var selectedAge: Double = 100
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
            Button("Click Me") {
                print("I am clicked")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
