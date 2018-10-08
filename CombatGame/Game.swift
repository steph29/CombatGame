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
    var gameTeams: [[String: String]] = []
    var Team1: [String: String] = [:]
    var Team2: [String: String] = [:]
    var combattant = Combattant()
    var colosse = Colosse()
    var mage = Mage()
    var nain = Nain()
    var hache = Hache()
    var epee = Epee()
    var lance = Lance()
    var sceptre = Sceptre()
    
    
    func CreateGame() -> [String: String]{
        for i in 1 ... 2 {
            print("Vous êtes l'équipe \(i) à jouer. Quelle est votre nom d'équipe?")
            Team2 = CreateTeam()
            if i == 1 {
                 Team1 = Team2
            }
            gameTeams.append(Team2)
        }
            return Team2
    }
    
    func CreateTeam() -> [String: String] {
        
       // MARK - Identité de l'équipe
                var teamName: String? = readLine()
                if teamNameArray.contains(teamName!) || teamName! == "" {
                repeat{
                    print("Veuillez en choisir un autre nom d'équipe")
                    teamName = readLine()
                    } while (teamNameArray.contains(teamName!))
                }
                teamNameArray.append(teamName!)
                print("Bienvenue \(teamName!)")
                var newTeams: [String: String] = [:]
               
                // MARK - Identité des personnages
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
                                        newTeams.updateValue(Epee.init().name, forKey: name!)
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
                                        newTeams.updateValue(Sceptre.init().name, forKey: name!)
                                        print("Voici \(name!), le mage à \(mage.pointOfLife) points de vie et a le pouvoir de sauver vos personnages grâce à son sceptre qui redonne \(abs(sceptre.damage)) points")
                              
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
                                         newTeams.updateValue(Lance.init().name, forKey: name!)
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
                                         newTeams.updateValue(Hache.init().name, forKey: name!)
                                        print("Voici \(name!), le nain à \(nain.pointOfLife) points de vie et possède une hache dont les dommages coûtent \(hache.damage) points")
                               
                            default:
                                print("Choisissez bien parmi les personnages proposés !")
                                } // fin du switch choice
                            } //fin du if var
                        } // fin de la boucle creation de 3 personages
                    return newTeams
                }// fin du CreateTeam
    }// Fin de la class

