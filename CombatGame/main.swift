//
//  main.swift
//  CombatGame
//
//  Created by stephane verardo on 26/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation
// MARK - Team
/*class Team {
    var players: [Player] = []
    
    // Ajout des joueurs dans le tableau d'une équipe
    func add(player: Player){
        players.append(player)
    }
    
}
*/

// MARK - Personnage
enum Type: Int {
    case Combattant = 100
    case Mage = 80
    case Colosse = 130
    case Nain = 60
}
enum Weapons: Int {
    case Épee = 10
    case Hache = 15
    case Sceptre = -10
    case Lance = 20
}

var pointsOfLife: Int = 0

class Player{
    var name: String
    var type: Type
    
    init(name: String, type: Type){
        self.name = name
        self.type = type
        switch type {
        case.Combattant:
             pointsOfLife = Type.Combattant.rawValue
             Weapons.Épee
        case.Mage:
             pointsOfLife = Type.Mage.rawValue
            Weapons.Sceptre
        case.Colosse:
             pointsOfLife = Type.Colosse.rawValue
            Weapons.Lance
        case.Nain:
             pointsOfLife = Type.Nain.rawValue
            Weapons.Hache
        }
    }
}

/*func CreatePlayer(name: String, type: Type){
    Player.name = name
    Player.type = choice
}
*/

for i in 1 ... 2 {
    print("Vous êtes l'équipe \(i) à jouer. Quelle est votre nom d'équipe?")
    if let teamName = readLine(){
        print("Bienvenue \(teamName)")
    }
    for i in 1 ... 3 {
        if i == 1 {
            print("Quel est votre premier personnage?")
        }else if i == 2{
            print("Quel est votre deuxième personnage?")
        }else{
            print("Enfin quel est votre troisième personnage?")
        }
        print("1. Le combattant"
            + "\n2. Le mage"
            + "\n3. Le colosse"
            + "\n4. Le nain")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Donnez lui un nom")
                if let name = readLine(){
                    print("Voici \(name), le combattants à \(Type.Combattant.rawValue) point de vie ")
                }
            case "2":
                print("Donnez lui un nom")
                if let name = readLine(){
                    print("Voici \(name), le mage à \(Type.Mage.rawValue) points de vie qui a le pouvoir de sauver vos personnages ")
                }
            case "3":
                print("Donnez lui un nom")
                if let name = readLine(){
                    print("Voici \(name), le colosse à \(Type.Colosse.rawValue) points de vie ")
                }
            case "4":
                print("Donnez lui un nom")
                if let name = readLine(){
                    print("Voici \(name), le nain à \(Type.Nain.rawValue) points de vie ")
                }
            default:
                print("Choisissez bien parmi les personnages proposés")
                // /_\  MEF si erreur revenir à l'étape précédente /_\
            } // fin du switch
        } // fin du if let choice
    } // fin de la boucle for création de personnage
} // fin de la boucle creation d'equipe



// MARK - Combat



