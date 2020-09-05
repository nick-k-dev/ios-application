//
//  ContentView.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

let data = [
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

struct ContentView: View {
    var body: some View {
        VStack {
            WordList()
            Spacer()
            SearchGrid(words: data)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
