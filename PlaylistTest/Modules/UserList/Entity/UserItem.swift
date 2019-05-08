//
//  UserItem.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation

struct UserItem: Codable, Hashable {
    private enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name
        case score
    }
    
    var userId: String
    var name: String
    var score: UInt
    
    static func == (lhs: UserItem, rhs: UserItem) -> Bool {
        return lhs.userId == rhs.userId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine((userId).hashValue)
    }
}
