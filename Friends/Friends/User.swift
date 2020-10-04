//
//  User.swift
//  Friends
//
//  Created by Abhishek Rawat on 04/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import Foundation

struct User : Codable {
    let id : String
    let isActive : Bool
    let name : String
    let age : Int
    let company : String
    let email : String
    let address : String
    let about : String
    let registered : String
    let tags : [String]
    let friends : [Friend]
}

struct Friend : Codable {
    let id : String
    let name : String
}
