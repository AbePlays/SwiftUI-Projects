//
//  ContentView.swift
//  Game of Thrones
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var books = [Book]()
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.id) { book in
                    NavigationLink(destination : BookDetails(book : book)) {
                        Text(book.name)
                    }
                }
            }
            .onAppear(perform: fetchBooks)
            .navigationBarTitle("Game of Thrones")
        }
    }
    
    func fetchBooks() {
        guard let url = URL(string: "https://anapioficeandfire.com/api/books/") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Book].self, from: data) {
                    DispatchQueue.main.async {
                        self.books = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
