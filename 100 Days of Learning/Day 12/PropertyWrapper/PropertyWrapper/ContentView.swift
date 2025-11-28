//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by Chanchal Raj on 28/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            TestingPropertyWrapper.test()
        }
    }
}

#Preview {
    ContentView()
}
