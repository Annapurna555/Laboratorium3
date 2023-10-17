//
//  ContentView.swift
//  Laboratorium3
//
//  Created by Paweł Karabowicz on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojiArray: [String] = ["🐹", "🐻", "🐵", "🐸","🦉", "🐴", "🧐", "😡"]
    @State var cardCount: Int = 2
    var body: some View {
        let scrollView = createScrollView
        VStack {
            Spacer().frame(height: 10)
            scrollView(cardCount, emojiArray)
                .foregroundColor(.blue)
                .padding(.top, 10)
                .padding(.horizontal, 10)
            HStack {
                Group{
                    adjustCardNumber(by: -2, symbol: "-")
                    .disabled(cardCount <= 2)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.blue, lineWidth: 2)
                        .frame(width:30, height:20))
                    Spacer()
                    adjustCardNumber(by: 2, symbol: "+")
                    .disabled(cardCount >= emojiArray.count)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.blue, lineWidth: 2)
                        .frame(width:30, height:20))
                }
                
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            }
            
        }
    }
    
    func createScrollView(cardCount: Int, emojiArray: [String]) -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                ForEach(emojiArray.prefix(cardCount), id: \.self) { emoji in
                    CardView(hiddenFlag: true, emoji: emoji).frame(height: 40)
                }
            }
        }
    }
    
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        let newCardCount = cardCount + offset
        
        return Button(action: {
            if newCardCount >= 2 && newCardCount <= emojiArray.count {
                cardCount = (newCardCount % 2 == 0) ? newCardCount : newCardCount - 1
            }
        }, label: {
            Text(symbol)
        })
        
    }
}
#Preview {
    ContentView()
}
//
