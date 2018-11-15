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
    
    // verify if player is dead
    public func IsDead(player: Player) -> Bool  {
        var isDead = false
        if player.pointOfLife <= 0 {
            isDead = true
            player.pointOfLife = 0
        }
        return isDead
    }
    
    // function for put damage to the opponent
    public func Hit(player: Player, weapon: Weapon) -> Player {
        player.pointOfLife = player.pointOfLife - weapon.damage
        print("Votre adversaire vient de perdre \(weapon.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
        if IsDead(player: player){
            print("Félicitation, vous venez d'éliminer un adversaire!")
        }
        return player
    }
    
    // function asking for the type of the player: warrior OR magus
    public func IsAFighter(player: Player) -> Bool{
        var isAFighter = false
        if !(player is Wizard){
            isAFighter = true
        }
        return isAFighter
    }
    
    // function for improve the capability of the scepter
    public func ImproveYourScepter(player: Player) -> Player {
        if(player is Wizard){
            player.weapon.damage = 20
        }
        return player
    }
}
