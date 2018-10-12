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
print(game.myTeam)
print(game.myTeam[0])
var myPlayer = game.myTeam[0]
print(myPlayer)
print(game.mage.name, game.mage.pointOfLife, game.mage.weapon.name, game.mage.weapon.damage)


