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
    
    
    
    func IsDead() -> Bool  {
       var isDead = false
        if pointOfLife <= 0 {
             isDead = true
        }
       return isDead
    }
    
    func Resurrect() -> String {
        pointOfLife = pointOfLife + sceptre.damage
                return ("Vous venez de recupérer \(sceptre.damage). Vous avez désormais \(pointOfLife) de points de vie.")

    }
    
    func Hit(weapon: Weapon) -> Int {
        if weapon.name == "hache" {
          pointOfLife = pointOfLife - hache.damage
            print("Vous venez de perdre \(hache.damage). Vous avez désormais \(pointOfLife) de points de vie.")
            if IsDead(){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return pointOfLife
        }else if weapon.name == "lance" {
             pointOfLife = pointOfLife - lance.damage
            print("Vous venez de perdre \(lance.damage). Vous avez désormais \(pointOfLife) de points de vie.")
            if IsDead(){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return pointOfLife
        }else{
            pointOfLife = pointOfLife - epee.damage
           print("Vous venez de perdre \(epee.damage). Vous avez désormais \(pointOfLife) de points de vie.")
            if IsDead(){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return pointOfLife
            }
        }
    }
