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
print(game.mage.name, game.mage.pointOfLife, game.mage.weapon.name, game.mage.weapon.damage)
print(game.colosse.name)
print(game.nain.weapon.name)
print(game.combattant.weapon.damage)


