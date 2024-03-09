//
//  ContentView.swift
//  Memorize
//
//  Created by Jack Jones on 26/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View{
    var isFaceUp: Bool = false
    var body: some View{
        ZStack() {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 5)
                Text("👾")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
        }
    }
}










#Preview {
    ContentView()
}
