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
    static var previews: some View {
        SearchGrid(words: WordData().words)
    }
}
