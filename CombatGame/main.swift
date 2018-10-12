//
//  main.swift
//  CombatGame
//
//  Created by stephane verardo on 26/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

var game = Game()
var mage = Mage()
var nain = Nain()
var hache = Hache()
var epee = Epee()
var lance = Lance()
var sceptre = Sceptre()
var colosse = Colosse()



game.CreateGame()
print(game.gameTeams)
print(game.gameTeams[0])
print(game.TeamDisplay())
print(mage.name, mage.pointOfLife, mage.weapon.name, mage.weapon.damage)
print(game.mage.Hit(weapon: hache))
print(game.mage.Hit(weapon: hache))
print(game.mage.Hit(weapon: hache))
print(game.mage.Hit(weapon: hache))
print(game.mage.Hit(weapon: hache))
print(game.mage.Hit(weapon: hache))

