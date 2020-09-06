//
//  WordList.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

let words = ["swift", "kotlin", "objectivec", "variable", "java", "mobile"]

struct WordList: View {
    @EnvironmentObject var wordData: WordData
    var body: some View {
        VStack {
            Text("Word Search:")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .padding(.top, 5.0)
                .padding(.bottom, 10)
            VStack {
                HStack {
                    ForEach((0..<words.count / 2), id: \.self) {
                        self.wordData.foundWordList.contains(words[$0]) ?
                        Text(words[$0]).strikethrough()
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray) :
                        Text(words[$0])
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                }
                HStack {
                    ForEach((words.count / 2..<words.count), id: \.self) {
                        self.wordData.foundWordList.contains(words[$0]) ?
                        Text(words[$0]).strikethrough()
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray) :
                        Text(words[$0])
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                }
            }
            Text("\(wordData.foundWordList.count) of \(words.count) found")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
        }
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList()
    }
}
