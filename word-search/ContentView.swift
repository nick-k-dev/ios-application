//
//  ContentView.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var wordData: WordData
    
    var body: some View {
        VStack {
            WordList()
            Spacer()
            SearchGrid(words: wordData.words)
            Spacer()
            CheckButton()
            Spacer()
        }.background(
            ZStack {
                Image("old-books-bg")
                Rectangle().fill(Color.black.opacity(0.7))
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
