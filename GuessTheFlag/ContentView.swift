//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hina Khan on 07/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//      RadialGradient
        RadialGradient(colors: [.blue,.black], center: .center, startRadius: 20, endRadius: 200)
//      LinearGradient
        LinearGradient(
            stops: [
                .init(color: .white, location: 0.44),
                .init(color: .blue, location: 0.55)
            ],
            startPoint: .top,
            endPoint: UnitPoint.bottom
        )
//      Practice Colors and frames
        ZStack() {
            VStack(spacing:0){
                Color.red
                Color.blue
            }
            Text("Your Content")
                .foregroundColor(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
