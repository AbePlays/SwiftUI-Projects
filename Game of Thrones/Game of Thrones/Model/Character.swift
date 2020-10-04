//
//  Character.swift
//  Game of Thrones
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import Foundation

struct Character : Codable {
    let id = UUID()
    let name : String
    let gender : String
    let born : String
    let culture : String
    let playedBy : [String]
}
