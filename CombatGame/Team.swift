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
    var teamNameArray: [String]
    
    init(player: [Player], teamName: [String]){
        self.players = player
        self.teamNameArray = teamName
    }
    
    // Ajout des joueurs dans le tableau d'une équipe
    func add(player: Player){
        players.append(player)
    }
    
    func CreateTeam() {
        for i in 1 ... 2 {
            print("Vous êtes l'équipe \(i) à jouer. Quelle est votre nom d'équipe?")
            if let teamName = readLine(){
                if !teamNameArray.contains(teamName){
                    teamNameArray.append(teamName)
                    print("Bienvenue \(teamName)")
                }else{
                    print("Ce nom d'équipe est déjà pris, veuillez en choisir un autre")}
            }
            Player.MakeYourTeam(name, type)
        }
}
}
