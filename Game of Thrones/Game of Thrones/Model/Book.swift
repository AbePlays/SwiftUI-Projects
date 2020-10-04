//
//  Book.swift
//  Game of Thrones
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import Foundation

struct Book : Codable {
    let id = UUID()
    let author = "George R. R. Martin"
    let name : String
    let numberOfPages : Int
    let released : String
    let povCharacters: [String]
}
