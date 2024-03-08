//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hina Khan on 07/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle=""
    @State private var showingScore=false
    @State private var scoreCount = 0
    @State private var questionCount = 0

    var body: some View {
        ZStack {
            //            Color(.blue).ignoresSafeArea()
            //            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            RadialGradient(stops: [
                Gradient.Stop(color: Color(red:0.1, green:0.2, blue:0.45), location: 0.3),
                Gradient.Stop(color: Color(red:0.76, green:0.15, blue:0.26), location: 0.3)],  center: .top, startRadius: 200, endRadius: 700) .ignoresSafeArea()
            VStack(){
                Spacer()
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
            VStack(spacing: 15){
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                    
                    
                }
                
                ForEach(0..<3){number in
                    Button{
                        //flag was tapped
                        flagTapper(number)
                    }label: {
                        Image(countries[number])
                            .clipShape(Capsule())
                        
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(Rectangle()).cornerRadius(20)
                Spacer()
                Spacer()
                Text("Score: \(scoreCount)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
        }
            .alert(scoreTitle, isPresented: $showingScore) {
                       if questionCount < 8 {
                           Button("Continue", action: askQuestion)
                       } else {
                           Button("Restart", action: restartGame)
                       }
                   }
        message: {
            Text("Your Score is \(scoreCount)")
        }
    }
    
   
    func flagTapper(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct"
                scoreCount += 1
            } else {
                scoreTitle = "Wrong! That's the flag of \(countries[number])."
                scoreCount -= 1
            }
            showingScore = true
            questionCount += 1
        }
    
    func askQuestion(){
        if questionCount < 8 {
            countries = countries.shuffled()
            correctAnswer = Int.random(in: 0...2)
        } else {
            showingScore = true
        }
    }
    
    func restartGame() {
            countries = countries.shuffled()
            correctAnswer = Int.random(in: 0...2)
            scoreCount = 0
            questionCount = 0
        }
}

struct AlertsView: View {
    @State private var showingAlert=false;

    var body: some View {
        Button{
            showingAlert=true
        }label: {
            Label("Show Alert", systemImage: "alert")
                .padding()
                .background(.red)
                .foregroundStyle(.white)
        }
        .alert("Important Message", isPresented: $showingAlert){
            Button("Delete",role: .destructive){}
            Button("Cancel",role: .cancel){}
        }
        message:{Text("Please read this")}
    }
}

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
//        ImagesView()
//        AlertsView()
        ContentView()

    }
}
