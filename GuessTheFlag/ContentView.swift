//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hina Khan on 07/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Text("Hello, world!")
            Text("This is inside a stack")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
