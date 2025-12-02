//
//  ContentView.swift
//  AppStorage
//
//  Created by Chanchal Raj on 02/12/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("click_me_title") var title: String = ""
    var body: some View {
        Button("Click Me: \(title)"){
            title = "Clicked"
        }
    }
}

#Preview {
    ContentView()
}
