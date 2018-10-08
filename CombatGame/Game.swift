//
//  Game.swift
//  CombatGame
//
//  Created by stephane verardo on 05/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Game {
    
    var teamNameArray: [String] = []
    var nameArray: [String] = []
    var players = [Player]()
    var teams: [String: String] = [:]
    var combattant = Combattant()
    var colosse = Colosse()
    var mage = Mage()
    var nain = Nain()
    var hache = Hache()
    var epee = Epee()
    var lance = Lance()
    var sceptre = Sceptre()
    
    
    func CreateTeam() -> [String: String]{
            for i in 1 ... 2 {
                // Determine the team name for each gamer
                print("Vous êtes l'équipe \(i) à jouer. Quelle est votre nom d'équipe?")
               
                var teamName: String? = readLine()
                if teamNameArray.contains(teamName!){
                repeat{
                    print("Ce nom d'équipe est déjà pris, veuillez en choisir un autre")
                    teamName = readLine()
                    } while (teamNameArray.contains(teamName!))
                }
                teamNameArray.append(teamName!)
                print("Bienvenue \(teamName!)")
               
                // Determine the player in each team
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
                        
                        if var choice = readLine() {
                            if !(choice == "1" || choice == "2" || choice == "3" || choice == "4"){
                                repeat{
                                print("Veuillez choisir parmi les personnages proposés !")
                                choice = readLine()!
                                } while (!(choice == "1" || choice == "2" || choice == "3" || choice == "4"))
                            }
                            switch choice {
                            case "1":
                                print("Donnez lui un nom")
                                var name: String? = readLine()
                                if nameArray.contains(name!) || name! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                    } while nameArray.contains(name!)
                                }
                                        nameArray.append(name!)
                                    teams.updateValue(Epee.init().name, forKey: name!)
                                        print("Voici \(name!), le combattants à \(combattant.pointOfLife) point de vie et possède une épee dont les dommages coûtent \(epee.damage) points")
                               
                            case "2":
                                print("Donnez lui un nom")
                                var name: String? = readLine()
                                if nameArray.contains(name!) || name! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                    } while nameArray.contains(name!)
                                }
                                        nameArray.append(name!)
                                        teams.updateValue(Sceptre.init().name, forKey: name!)
                                        print("Voici \(name!), le mage à \(mage.pointOfLife) points de vie qui a le pouvoir de sauver vos personnages et possède un sceptre qui redonne \(abs(sceptre.damage)) points")
                              
                            case "3":
                                print("Donnez lui un nom")
                                var name: String? = readLine()
                                if nameArray.contains(name!) || name! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                    } while nameArray.contains(name!)
                                }
                                        nameArray.append(name!)
                                         teams.updateValue(Lance.init().name, forKey: name!)
                                        print("Voici \(name!), le colosse à \(colosse.pointOfLife) points de vie et possède une lance dont les dommages coûtent \(lance.damage) points")
                                
                            case "4":
                                print("Donnez lui un nom")
                                var name: String? = readLine()
                                if nameArray.contains(name!) || name! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                    } while nameArray.contains(name!)
                                }
                                        nameArray.append(name!)
                                         teams.updateValue(Hache.init().name, forKey: name!)
                                        print("Voici \(name!), le nain à \(nain.pointOfLife) points de vie et possède une hache dont les dommages coûtent \(hache.damage) points")
                               
                            default:
                                print("Choisissez bien parmi les personnages proposés !")
                                } // fin du switch
                            }
                        }
                
                }// fin du if let choice
        return teams
    }

}
