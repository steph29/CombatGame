//
//  main.swift
//  CombatGame
//
//  Created by stephane verardo on 26/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

// MARK - Personnage
enum Type {
    case Archer, Guerrier, Mage
}
class Player{
    var name: String = ""
}
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
                    print("Voici \(name), le combattants à 100 point de vie ")
                }
            case "2":
                print("Donnez lui un nom")
                if let name = readLine(){
                    print("Voici \(name), le mage à 80 points de vie qui a le pouvoir de sauver vos personnages ")
                }
            case "3":
                print("Donnez lui un nom")
                if let name = readLine(){
                    print("Voici \(name), le colosse à 130 points de vie ")
                }
            case "4":
                print("Donnez lui un nom")
                if let name = readLine(){
                    print("Voici \(name), le nain à 60 points de vie ")
                }
            default:
                print("Choisissez bien parmi les personnages proposés")
                // /_\  MEF si erreur revenir à l'étape précédente /_\
            } // fin du switch
        } // fin du if let choice
    } // fin de la boucle for création de personnage
} // fin de la boucle creation d'equipe



// MARK - Combat

