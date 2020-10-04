//
//  BookDetails.swift
//  Game of Thrones
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct BookDetails: View {
    var book : Book
    var body: some View {
        Form {
            Section {
                Text("Author")
                    .font(.headline)
                    .bold()
                Text(book.author)
            }
            
            Section {
                Text("Number of Pages")
                    .font(.headline)
                .bold()
                
                Text("\(book.numberOfPages)")
            }
            
            Section {
                Text("Date Released")
                    .font(.headline)
                .bold()
                
                Text(book.released.dropLast(9))
            }
            
            Section {
                NavigationLink(destination : CharacterView(urls: book.povCharacters)) {
                    Text("Characters")
                }
            }
        }
        .navigationBarTitle(book.name)
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(book : Book(name: "Abcd", numberOfPages: 236, released: "2014-06-17T00:00:00", povCharacters: ["Abe"]))
    }
}
