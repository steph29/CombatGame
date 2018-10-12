//
//  Player.swift
//  CombatGame
//
//  Created by stephane verardo on 28/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Player: Hashable {
    var name: String
    var pointOfLife: Int
    var weapon: Weapon
    
    var epee = Epee()
    var lance = Lance()
    var hache = Hache()
    var sceptre = Sceptre()
    
    public var hashValue: Int{
        return name.hashValue
    }
    
    public static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
    
    init(name: String, pointOfLife: Int, weapon: Weapon){
        self.name = name
        self.pointOfLife = pointOfLife
        self.weapon = weapon
     }
 }
