//
//  Player.swift
//  CombatGame
//
//  Created by stephane verardo on 28/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

enum PlayerType {
    case colosse, mage, nain, combattant
}
// MARK - Creation of Player with the different parameters
class Player {
   public var name: String // name of the player
   public var type: PlayerType // type of the player
   public var pointOfLife: Int // points of life of the player
   public var weapon: Weapon // weapon using by the player
    
    init(name: String, type: PlayerType, pointOfLife: Int, weapon: Weapon){
        self.name = name
        self.type = type
        self.pointOfLife = pointOfLife
        self.weapon = weapon
     }
 }
