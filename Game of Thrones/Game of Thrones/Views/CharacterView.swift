//
//  CharacterView.swift
//  Game of Thrones
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    var urls : [String]
    @State private var characters = [Character]()
    var body: some View {
        List {
            ForEach(characters, id: \.id) { character in
                NavigationLink(destination : CharacterDetails(character: character)) {
                    Text(character.name)
                }
            }
        }
        .onAppear(perform: loadCharacters)
        .navigationBarTitle("Characters")
    }
    
    func loadCharacters() {
        for link in urls {
            guard let url = URL(string: link) else {
                print("Invalid URL")
                return
            }

            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(Character.self, from: data) {
                        DispatchQueue.main.async {
                            self.characters.append(decodedResponse)
                        }
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }.resume()
        }
    }
}
