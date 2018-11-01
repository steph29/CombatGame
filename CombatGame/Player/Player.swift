//
//  Player.swift
//  CombatGame
//
//  Created by stephane verardo on 28/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Player {
   public var name: String
   public var type: String
   public var pointOfLife: Int
   public var weapon: Weapon
    
    init(name: String, type: String, pointOfLife: Int, weapon: Weapon){
        self.name = name
        self.type = type
        self.pointOfLife = pointOfLife
        self.weapon = weapon
     }
 }
