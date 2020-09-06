//
//  Square.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

let blueColor = Color(red: 0, green: 100 / 255.0, blue: 201 / 255.0)
let pinkColor = Color(red: 1, green: 100 / 255.0, blue: 201 / 255.0)
let darkColor = Color(red: 0, green: 28 / 255.0, blue: 57 / 255.0)

struct Letter: View {
    let letterData: WordData.LetterData
    @EnvironmentObject var wordData: WordData
    @State var selected = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(letterData.status == WordData.Status.neutral ? blueColor : letterData.status == WordData.Status.selected ? pinkColor : darkColor)
            .frame(width: 30, height: 30)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .disabled(letterData.status == WordData.Status.disabled)
            Text(letterData.letter)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .onTapGesture {
            self.selected = self.letterData.status == WordData.Status.neutral ? false : true
            if self.selected {
                if let index = self.wordData.selection.firstIndex(of: "\(self.letterData.coord.0)\(self.letterData.coord.1)") {
                    self.wordData.words[self.letterData.coord.0][self.letterData.coord.1].status = WordData.Status.neutral
                    self.wordData.selection.remove(at: index)
                }
            }
            else {
                self.wordData.words[self.letterData.coord.0][self.letterData.coord.1].status = WordData.Status.selected
                self.wordData.selection.append("\(self.letterData.coord.0)\(self.letterData.coord.1)")
            }
        }.animation(.spring())
    }
}

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Letter(letterData: WordData.LetterData(letter: "a", coord: (0,0), status: WordData.Status.neutral))
    }
}
