//
//  Player.swift
//  WordHunt
//
//  Created by Tam Dang on 2019-03-31.
//  Copyright © 2019 Tech. All rights reserved.
//

import Foundation
class Player {
    var id: Int
    var name: String
    var score: Int
    
    init(id: Int, name: String, score: Int) {
        self.id = id
        self.name = name
        self.score = score
    }
}
