//
//  DetailsView.swift
//  Friends
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    let user : User
    let users : [User]
    var body: some View {
        Form {
            Text("Age").font(.headline)
            Text("\(user.age)")
            Text("Email").font(.headline)
            Text(user.email)
            Text("Company").font(.headline)
            Text(user.company)
            Text("About").font(.headline)
            Text(user.about)
            Text("Friends").font(.headline)
            ForEach(user.friends, id: \.id) { user in
                NavigationLink(destination: DetailsView(user: self.findUser(id: user.id), users: self.users)) {
                    Text(user.name)
                }
            }
        }
    .navigationBarTitle(Text(user.name))
    }
    
    func findUser(id: String) -> User {
        for user in users {
            if user.id == id {
                return user
            }
        }
        
        fatalError("Couldnt find this user")
    }
}
