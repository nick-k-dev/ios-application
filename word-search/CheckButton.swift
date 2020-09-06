//
//  CheckButton.swift
//  word-search
//
//  Created by Nick on 2020-09-05.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

struct CheckButton: View {
    @EnvironmentObject var wordData: WordData

    var body: some View {
        Button(action: {
            let _ = self.wordData.checkSelection()
            self.wordData.clearSelected()
        }) {
            Text("Check Word")
        }
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton()
    }
}
