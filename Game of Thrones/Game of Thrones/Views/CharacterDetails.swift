//
//  CharacterDetails.swift
//  Game of Thrones
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct CharacterDetails: View {
    var character : Character
    var body: some View {
        Form {
            Section {
                Text("Played By").font(.headline).bold()
                Text(character.playedBy[0])
            }
            Section {
                Text("Gender").font(.headline).bold()
                Text(character.gender)
            }
            Section {
                Text("Born on").font(.headline).bold()
                Text(character.born)
            }
            Section {
                Text("Culture").font(.headline).bold()
                Text(character.culture)
            }
        }.navigationBarTitle(character.name)
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(character: Character(name: "Abe", gender: "Male", born: "Long Ago", culture: "Northem", playedBy: ["Abhishek Rawat"]))
    }
}
