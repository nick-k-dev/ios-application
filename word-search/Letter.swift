//
//  Square.swift
//  word-search
//
//  Created by Nick on 2020-09-04.
//  Copyright © 2020 Nick Komarnicki. All rights reserved.
//

import SwiftUI

struct Letter: View {
    let letter: String
    @State var selected = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(self.selected ? Color.red : Color.white)
            .frame(width: 30, height: 30)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Text(letter)
        }
        .onTapGesture {
            self.selected.toggle()
        }
    }
}

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Letter(letter: "L")
    }
}
