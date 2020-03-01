//
//  PostData.swift
//  H4XOR News
//
//  Created by Abhishek Rawat on 02/03/20.
//  Copyright © 2020 Abhishek Rawat. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
