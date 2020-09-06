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
    @State var showMessage = false
    
    var body: some View {
        Button(action: {
            let _ = self.wordData.checkSelection()
            self.wordData.clearSelected()
            self.showMessage = self.wordData.checkGameOver()
        }) {
            Text("Check Word")
        }.padding(15.0).alert(isPresented: $showMessage) {
            Alert(title: Text("Game Over"), message: Text("Congratulations! You Won!"), dismissButton: .default(Text("OK")))
        }.background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
        .foregroundColor(Color.white)
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton()
    }
}
