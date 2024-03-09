//
//  ContentView.swift
//  Memorize
//
//  Created by Jack Jones on 26/02/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👾", "🚀", "🛸", "👽", "👹", "🤖", "👻", "💀", "☠️", "🎃", "🪐"]
    // let emojis: [String] = [...]
    // or can do emojis: Array<String> = [...], above is the preferred syntax
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action:{
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "minus.rectangle")
    }
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "plus.rectangle")
    }
}

struct CardView: View{
    // Don't need to speify type as Swift infers types
    // Option click to find out
    let content: String
    @State var isFaceUp = true
    var body: some View{
        ZStack() {
            // View builder can only create local variables
            // Ifs, lists, local variable assignments, switch statements
            // Can't do x = x + 1
            // Should only use let in view builder as you don't want anything in here changing
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            // Normally vars in views are immutable(can't be changed)
            // @State lets us change it in this instance but we would normally
            // have seperate dame logic that would change this
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
