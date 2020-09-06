//
//  Word.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

struct Word: View {
    let letters: [WordData.LetterData]
    
    var body: some View {
        HStack {
            ForEach((0..<letters.count), id: \.self) {
                Letter(letterData: self.letters[$0])
            }
        }
    }
}

struct Word_Previews: PreviewProvider {
    static var previews: some View {
        Word(letters: [WordData.LetterData(letter: "x", coord: (0,0), status: WordData.Status.neutral)])
    }
}
