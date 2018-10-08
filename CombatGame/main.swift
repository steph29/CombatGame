//
//  main.swift
//  CombatGame
//
//  Created by stephane verardo on 26/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

var game = Game(teamNameArray: [], nameArray: [])
game.CreateTeam()
print(game.teamNameArray.count)
print(game.teamNameArray[1])
print(game.teamNameArray)

