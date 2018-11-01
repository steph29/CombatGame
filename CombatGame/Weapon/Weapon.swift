//
//  Weapons.swift
//  CombatGame
//
//  Created by stephane verardo on 03/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Weapon {
    public var damage: Int
    public var name: String
  
   init(damage: Int, name: String) {
        self.damage = damage
        self.name = name
    }
}
