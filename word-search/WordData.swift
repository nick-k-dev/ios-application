//
//  WordData.swift
//  word-search
//
//  Created by Nick on 2020-09-05.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import Foundation
class WordData: ObservableObject {
    @Published var wordLocations = [
        "swift": ["02","03","04","05","06"],
        "kotlin": ["54","55","56","57","58","59"],
        "objectivec": ["90","91","92","93","94","95","96","97","98","99"],
        "variable": ["12","13", "14", "15", "16", "17", "18", "19"],
        "java": ["01","11","21","31"],
        "mobile": ["32","42","52","62","72","82"]
    ]
    
    @Published var selection: [String] = [String]()
    
    @Published var foundWordList = [String]()
    
    @Published var words: [[LetterData]]
    
    init() {
        words = [[LetterData]]()
        words = self.fillData()
    }
    
    enum Status {
        case selected
        case disabled
        case neutral
    }
    
    struct LetterData {
        var letter: String
        var coord: (Int, Int)
        var status: Status
    }
    
    @Published var wordsData = [
        ["u", "j", "s", "w", "i", "f", "t", "l", "m", "a"],
        ["e", "a", "v", "a", "r", "i", "a", "b", "l", "e"],
        ["l", "v", "z", "y", "i", "b", "c", "h", "p", "l"],
        ["q", "a", "m", "u", "n", "f", "v", "n", "a", "y"],
        ["z", "m", "o", "b", "y", "l", "e", "x", "q", "z"],
        ["d", "l", "b", "t", "k", "o", "t", "l", "i", "n"],
        ["z", "a", "i", "b", "e", "i", "l", "x", "q", "z"],
        ["z", "k", "l", "b", "i", "x", "e", "x", "q", "z"],
        ["z", "m", "e", "b", "i", "l", "e", "x", "q", "z"],
        ["o", "b", "j", "e", "c", "t", "i", "v", "e", "c"]
    ]
    
    func checkSelection () -> Bool {
        var foundWord = false
        for (word, coordinates) in wordLocations {
            if coordinates.count == selection.count {
                for i in 0..<selection.count {
                    if coordinates.contains(selection[i]) {
                        foundWord = true
                    } else {
                        foundWord = false
                        break
                    }
                }
                if foundWord {
                    foundWordList.append(word)
                    for i in 0..<selection.count {
                        words[selection[i].first?.wholeNumberValue ?? 0][(selection[i].last?.wholeNumberValue) ?? 0].status = Status.disabled
                    }
                    wordLocations.removeValue(forKey: word)
                    return foundWord
                }
            }
        }
        return foundWord
    }
    
    func fillData () -> [[LetterData]] {
        var data: [[LetterData]] = []
        for i in 0..<wordsData.count {
            var words: [LetterData] = []
            for j in 0..<wordsData[i].count {
                words.append(LetterData(letter: wordsData[i][j], coord: (i, j), status: Status.neutral))
            }
            data.append(words)
        }
        return data
    }
    
    func clearSelected () -> Void {
        for i in 0..<words.count {
            for j in 0..<words[i].count {
                words[i][j].status = words[i][j].status == Status.disabled ? Status.disabled : Status.neutral
            }
        }
        selection.removeAll()
    }
}
