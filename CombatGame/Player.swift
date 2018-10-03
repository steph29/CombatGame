//
//  Player.swift
//  CombatGame
//
//  Created by stephane verardo on 28/09/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Player {

    enum Types: Int {
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
    
    var nameArray: [String]
    var type: Types
    
    init(name: [String], type: Types){
        self.nameArray = name
        self.type = type
        switch type {
        case.Combattant:
            pointsOfLife = Types.Combattant.rawValue
            Weapons.Épee
        case.Mage:
            pointsOfLife = Types.Mage.rawValue
            Weapons.Sceptre
        case.Colosse:
            pointsOfLife = Types.Colosse.rawValue
            Weapons.Lance
        case.Nain:
            pointsOfLife = Types.Nain.rawValue
            Weapons.Hache
        }
    }
    
    
    func MakeYourTeam(name: String, type: Types){
        for i in 1 ... 3 {
                repeat {
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
                               if !nameArray.contains(name) {
                                nameArray.append(name)
                                print("Voici \(name), le combattants à \(Types.Combattant.rawValue) point de vie ")
                               }else {
                                print("Le nom est déjà pris, veuillez en donner un autre")
                                }
                            }
                        case "2":
                            print("Donnez lui un nom")
                            if let name = readLine(){
                                if !nameArray.contains(name) {
                                    nameArray.append(name)
                                print("Voici \(name), le mage à \(Types.Mage.rawValue) points de vie qui a le pouvoir de sauver vos personnages ")
                                }else {
                                    print("Le nom est déjà pris, veuillez en donner un autre")
                                }
                            }
                        case "3":
                            print("Donnez lui un nom")
                            if let name = readLine(){
                                if !nameArray.contains(name) {
                                    nameArray.append(name)
                                print("Voici \(name), le colosse à \(Types.Colosse.rawValue) points de vie ")
                                } else {
                                    print("Le nom est déjà pris, veuillez en donner un autre")
                                }
                            }
                                    
                        case "4":
                            print("Donnez lui un nom")
                            if let name = readLine(){
                                if !nameArray.contains(name) {
                                    nameArray.append(name)
                                print("Voici \(name), le nain à \(Types.Nain.rawValue) points de vie ")
                                }else {
                                    print("Le nom est déjà pris, veuillez en donner un autre")
                                }
                            }
                        default:
                            print("Choisissez bien parmi les personnages proposés")
                        }
                    } // fin du switch
                } // fin du if let choice
                    while ( (i != 1) && (i != 2)  && (i != 3) && (i != 4) )
            } // fin de la boucle for création de personnage
        } // fin de la boucle creation d'equipe
    }
