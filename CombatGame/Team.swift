//
//  Team.swift
//  CombatGame
//
//  Created by stephane verardo on 28/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Team {
    var players: [Player] = []
    
    // Ajout des joueurs dans le tableau d'une équipe
    func add(player: Player){
        players.append(player)
    }
    
}
