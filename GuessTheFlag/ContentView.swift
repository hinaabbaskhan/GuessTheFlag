//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hina Khan on 07/01/2024.
//

import SwiftUI

struct ButtonAndImages: View {
    var body: some View {
        Button("Delete Selection", role:.destructive, action: executeDelete)
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}
struct FrameColorsAndGradients: View {
    var body: some View {
//      Simple Linear Gradient
        Text("Your content")
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .foregroundColor(.white)
            .background(.red.gradient)
//      AngularGradient
        AngularGradient(colors: [.red,.purple,.indigo,.blue,.green,.yellow,.orange,.red], center: .center)
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
//        FrameColorsAndGradients()
        ButtonAndImages()
    }
}
