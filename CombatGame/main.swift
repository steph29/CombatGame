//
//  main.swift
//  CombatGame
//
//  Created by stephane verardo on 26/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

var game = Game()
var combattant = Combattant()
var epee = Epee()
game.CreateGame()
print(game.gameTeams)
print(game.gameTeams.first!)
print(game.combattant.hashValue)
print(game.colosse.IsDead())
print(game.combattant.Resurrect())
print(game.nain.Hit(weapon: epee))

