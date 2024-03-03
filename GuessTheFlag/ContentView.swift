//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hina Khan on 07/01/2024.
//

import SwiftUI

struct ImagesView: View {
    var body: some View {
        ZStack{
        Image("maldives")
        Image(decorative: "maldives")//will load the same image, but won’t read it out for users who have enabled the screen reader
        Image(systemName: "pencil.circle")
            .foregroundStyle(.white)
            .font(.largeTitle)
        }
    }
}


struct ButtonsView: View {
    var body: some View {
        VStack{
            Button("Delete Selection", role:.destructive, action: executeDelete)
            Button("Button 1", role: .destructive){}.buttonStyle(.bordered)
            Button("Button 2"){}.buttonStyle(.bordered)
            Button("Button 3", role: .destructive){}.buttonStyle(.borderedProminent)
            Button("Button 4"){}.buttonStyle(.borderedProminent)
//          If you want to customize the colors used for a bordered button, use the tint() modifier
//          Important: Apple explicitly recommends against using too many prominent buttons,
//          because when everything is prominent nothing is.
            Button("Button 4"){}.buttonStyle(.borderedProminent).tint(.mint)
//          Custom Button
            Button{
                print("Taping..")
            }label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            Button{
                print("Button was tapped")
            }label: {
                HStack{
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }
            Button{
                print("Button was tapped")
            }label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .background(.red)
                    .foregroundStyle(.white)
            }
            
        
        }
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
//        ButtonsView()
        ImagesView()
    }
}
