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
    var pointOfLife: Int
    var epee = Epee()
    var lance = Lance()
    var hache = Hache()
    var sceptre = Sceptre()

    init(name: String, pointOfLife: Int){
        self.name = name
        self.pointOfLife = pointOfLife
     }
    
    func Dead()  {
        if pointOfLife == 0 {
            print("Votre personnage est malheureusement décédé des suites de ses plessures!")
        }
    }
    
    func Resurrect() {
        return pointOfLife = pointOfLife - sceptre.damage
        print("Vous venez de recupérer \(sceptre.damage). Vous avez désormais \(pointOfLife) de points de vie.")
    }
    
    func Hit() {
        let weaponUse = Weapon(damage: 0, name: "")
        if weaponUse.name == "Hache" {
            return pointOfLife = pointOfLife - hache.damage
            print("Vous venez de perdre \(hache.damage). Vous avez désormais \(pointOfLife) de points de vie.")
        }else if weaponUse.name == "Lance" {
            return pointOfLife = pointOfLife - lance.damage
            print("Vous venez de perdre \(lance.damage). Vous avez désormais \(pointOfLife) de points de vie.")
        }else if weaponUse.name == "Epee" {
            return pointOfLife = pointOfLife - epee.damage
            print("Vous venez de perdre \(epee.damage). Vous avez désormais \(pointOfLife) de points de vie.")
        }
    }
    
    
    
    
    }
