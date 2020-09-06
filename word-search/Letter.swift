//
//  Square.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

struct Letter: View {
    let letterData: WordData.LetterData
    @EnvironmentObject var wordData: WordData
    @State var selected = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(letterData.status == WordData.Status.neutral ? Color.blue : letterData.status == WordData.Status.selected ? Color.red : Color.gray)
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
        }
    }
}

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Letter(letterData: WordData.LetterData(letter: "a", coord: (0,0), status: WordData.Status.neutral))
    }
}
