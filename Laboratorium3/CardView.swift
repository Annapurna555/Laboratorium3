//
//  CardView.swift
//  Laboratorium3
//
//  Created by Paweł Karabowicz on 16/10/2023.
//

import SwiftUI

struct CardView: View {
    @State var hiddenFlag: Bool = false
    @State var emoji: String
    var body: some View {
//        Text(emoji)
//            .background(RoundedRectangle(cornerRadius: 12)
//                .frame(width: 100, height: 100, alignment: .center)
//                .border(Color.blue, width: 2)
//                .background(hiddenFlag ? Color.blue : Color.white))
//
//            .font(.largeTitle)
//            .opacity(hiddenFlag ? 0.1 : 1)
//            .onTapGesture {
//                self.hiddenFlag = !self.hiddenFlag
        
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue, lineWidth: 2)
                Text(emoji)
                RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue)
                .opacity(hiddenFlag ? 0 : 1)
            }
//                .frame(width: 100, height: 100)
            .onTapGesture {
                self.hiddenFlag = !self.hiddenFlag
            }
        }
        

    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}

