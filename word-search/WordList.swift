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
    var body: some View {
        HStack {
            ForEach((0..<words.count), id: \.self) {
                Text(words[$0])
            }
        }
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList()
    }
}
