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
    var gameTeams: [[Player: Weapon]] = []
    var Team1: [Player: Weapon] = [:]
    var Team2: [Player: Weapon] = [:]
    var player = Player(name: "", pointOfLife: 0, weapon: Epee())
    var combattant = Combattant()
    var mage = Mage()
    var nain = Nain()
    var hache = Hache()
    var epee = Epee()
    var lance = Lance()
    var sceptre = Sceptre()
    var colosse = Colosse()
   
    
    
    func TeamDisplay() {
        print("Voici l'équipe adversaire: "
        + "\n \(gameTeams[0])")
        
    }
    
    func ChoiceOppositePlayer() -> String {
        print("Choisissez votre adversaire:")
        var opponent: String? = readLine()
        if opponent == ""{
            print("Choisissez votre adversaire")
            opponent = readLine()!
        }else{
            opponent = "Pour essai"
        }
        
        return opponent!
    }
    
    func CreateGame() -> [Player: Weapon]{
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
    
    
    
    func CreateTeam() -> [Player: Weapon] {
        
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
                var newTeams: [Player: Weapon] = [:]
    
               
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
                                        combattant.name = name!
                                        newTeams.updateValue(epee, forKey: combattant)
                                        print("Voici \(name!), le combattants à \(combattant.pointOfLife) point de vie et possède une \(epee.name) dont les dommages coûtent \(epee.damage) points")
                                      
                               
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
                                         mage.name = name! 
                                        newTeams.updateValue(sceptre, forKey: mage)
                                        print("Voici \(name!), le mage à \(mage.pointOfLife) points de vie et a le pouvoir de sauver vos personnages grâce à son \(sceptre.name) qui redonne \(abs(sceptre.damage)) points")
                                        print(mage.name)
                              
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
                                        colosse.name = name!
                                         newTeams.updateValue(lance, forKey: colosse)
                                        print("Voici \(name!), le colosse à \(colosse.pointOfLife) points de vie et possède une \(lance.name) dont les dommages coûtent \(lance.damage) points")
                                
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
                                        nain.name = name!
                                         newTeams.updateValue(hache, forKey: nain)
                                        print("Voici \(name!), le nain à \(nain.pointOfLife) points de vie et possède une \(hache.name) dont les dommages coûtent \(hache.damage) points")
                               
                            default:
                                print("Choisissez bien parmi les personnages proposés !")
                                } // fin du switch choice
                            } //fin du if var
                        } // fin de la boucle creation de 3 personages
                    return newTeams
                }// fin du CreateTeam
    
    func Resurrect(player: Player) -> Int {
        player.pointOfLife = player.pointOfLife + sceptre.damage
        print ("Vous venez de recupérer \(sceptre.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
        return game.player.pointOfLife
    }
    
    func Hit(player: Player, weapon: Weapon) -> Int {
        if weapon.name == "hache" {
            player.pointOfLife = player.pointOfLife - hache.damage
            print("Vous venez de perdre \(hache.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
            if IsDead(){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return player.pointOfLife
        }else if weapon.name == "lance" {
           player.pointOfLife = player.pointOfLife - lance.damage
            print("Vous venez de perdre \(lance.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
            if IsDead(){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return player.pointOfLife
        }else{
            player.pointOfLife = player.pointOfLife - epee.damage
            print("Vous venez de perdre \(epee.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
            if IsDead(){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return player.pointOfLife
        }
    }
    
    
    func IsDead() -> Bool  {
        var isDead = false
        if game.player.pointOfLife <= 0 {
            isDead = true
        }
        return isDead
    }
    }// Fin de la class

