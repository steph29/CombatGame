//
//  Team.swift
//  CombatGame
//
//  Created by stephane verardo on 28/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Team: Player{
    
    var players: [Player]
    var teamName: String
    
    init(player: [Player], teamName: String){
        self.players = player
        self.teamName = teamName
        super.init(name: "", pointOfLife: 0)
 
    }
    
    // Ajout des joueurs dans le tableau d'une équipe
    func add(player: Player){
        players.append(player)
    }
    
    
}
