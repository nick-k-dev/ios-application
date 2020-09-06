//
//  SearchGrid.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

struct SearchGrid: View {
    let words: [[WordData.LetterData]]
    
    var body: some View {
        VStack {
            ForEach((0..<words.count), id: \.self) {
                Word(letters: self.words[$0])
            }
        }
    }
}

struct SearchGrid_Previews: PreviewProvider {
    static let data = [
        ["u", "j", "s", "w", "i", "f", "t", "l", "m", "a"],
        ["v", "a", "r", "i", "a", "b", "l", "e", "j", "u"],
        ["l", "v", "z", "y", "i", "b", "c", "h", "p", "l"],
        ["q", "a", "m", "u", "n", "f", "v", "n", "a", "y"],
        ["z", "m", "o", "b", "y", "l", "e", "x", "q", "z"],
        ["d", "l", "b", "t", "k", "o", "t", "l", "i", "n"],
        ["z", "a", "i", "b", "e", "i", "l", "x", "q", "z"],
        ["z", "k", "l", "b", "i", "x", "e", "x", "q", "z"],
        ["z", "m", "e", "b", "i", "l", "e", "x", "q", "z"],
        ["o", "b", "j", "e", "c", "t", "i", "v", "e", "c"]
    ]
    static var previews: some View {
        SearchGrid(words: WordData().words)
    }
}
