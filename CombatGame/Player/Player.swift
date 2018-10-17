//
//  Player.swift
//  CombatGame
//
//  Created by stephane verardo on 28/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var type: String
    var pointOfLife: Int
    var weapon: Weapon
    
    init(name: String, type: String, pointOfLife: Int, weapon: Weapon){
        self.name = name
        self.type = type
        self.pointOfLife = pointOfLife
        self.weapon = weapon
     }
 }
