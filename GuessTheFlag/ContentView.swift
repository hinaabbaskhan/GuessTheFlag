//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hina Khan on 07/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {
            Color.secondary
                .frame(minWidth:200, maxWidth:.infinity,  maxHeight: 200)
            Text("Your Content")
        }
        .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
