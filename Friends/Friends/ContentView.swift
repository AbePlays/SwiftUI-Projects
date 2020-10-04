//
//  ContentView.swift
//  Friends
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: DetailsView(user : user, users: self.users)) {
                        VStack(alignment: .leading) {
                            Text("\(user.name)").font(.headline)
                            Text("\(user.age)")
                        }
                    }
                }
            }.onAppear(perform: loadData)
                .navigationBarTitle("Friends")
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
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
