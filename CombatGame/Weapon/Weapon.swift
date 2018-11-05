//
//  Weapons.swift
//  CombatGame
//
//  Created by stephane verardo on 03/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

enum WeaponType {
    case hache, epee, lance, sceptre
}
// MARK - Creation of class about weapons with differents parameters
class Weapon {
    public var damage: Int // effect of the weapons
    public var name: WeaponType // name of the weapon
  
   init(damage: Int, name: WeaponType) {
        self.damage = damage
        self.name = name
    }
}
