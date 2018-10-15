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
    var myTeam: [[Player]] = []
    var player = Player(name: "", pointOfLife: 0, weapon: Epee())
    var myTeam1: [Player] = []
    var myTeam2: [Player] = []
    
  
    func CreateGame() -> [Player]{
        for i in 1 ... 2 {
            print("Vous êtes l'équipe \(i) à jouer. Quelle est votre nom d'équipe?")
            myTeam2 = CreateTeam()
            if i == 1 {
                myTeam1 = myTeam2
            }
            myTeam.append(myTeam2)
        }
            return myTeam2
       
    }
    
   func CreateTeam() -> [Player] {
        
       // MARK - Identité de l'équipe
                var teamName: String? = readLine()
                var upperTeamName = teamName?.uppercased()
                if teamNameArray.contains(upperTeamName!) || upperTeamName! == "" {
                repeat{
                    print("Veuillez en choisir un autre nom d'équipe")
                    teamName = readLine()
                    upperTeamName = teamName!.uppercased()
                    } while (teamNameArray.contains(upperTeamName!) || upperTeamName! == "")
                }
                teamNameArray.append(upperTeamName!)
                print("Bienvenue \(teamName!)")
                var myTeam: [Player] = []
    
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
                                var upperName = name?.uppercased()
                                if nameArray.contains(upperName!) || upperName! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                        upperName = name!.uppercased()
                                    } while (nameArray.contains(upperName!) || upperName! == "")
                                }
                                nameArray.append(upperName!)
                                let combattant = Combattant(name: name!)
                                let epee = Epee()
                                combattant.weapon = epee
                                print("Voici \(name!), le combattants à \(combattant.pointOfLife) point de vie et possède une \(epee.name) dont les dommages coûtent \(epee.damage) points")
                                myTeam.append(combattant)
                               
                            case "2":
                                print("Donnez lui un nom")
                                var name: String? = readLine()
                                var upperName = name?.uppercased()
                                if nameArray.contains(upperName!) || upperName! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                        upperName = name!.uppercased()
                                    } while (nameArray.contains(upperName!) || upperName! == "")
                                }
                                nameArray.append(upperName!)
                                let mage = Mage(name: name!)
                                let sceptre = Sceptre()
                                mage.weapon = sceptre
                                print("Voici \(name!), le mage à \(mage.pointOfLife) points de vie et a le pouvoir de sauver vos personnages grâce à son \(sceptre.name) qui redonne \(abs(sceptre.damage)) points")
                                myTeam.append(mage)
                              
                            case "3":
                                print("Donnez lui un nom")
                                var name: String? = readLine()
                                var upperName = name?.uppercased()
                                if nameArray.contains(upperName!) || upperName! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                        upperName = name!.uppercased()
                                    } while (nameArray.contains(upperName!) || upperName! == "")
                                }
                                nameArray.append(upperName!)
                                let colosse = Colosse(name: name!)
                                let lance = Lance()
                                colosse.weapon = lance
                                print("Voici \(name!), le colosse à \(colosse.pointOfLife) points de vie et possède une \(lance.name) dont les dommages coûtent \(lance.damage) points")
                                myTeam.append(colosse)
                               
                                
                            case "4":
                                print("Donnez lui un nom")
                                var name: String? = readLine()
                                var upperName = name?.uppercased()
                                if nameArray.contains(upperName!) || upperName! == "" {
                                    repeat{
                                        print("Veuillez en donner un autre nom")
                                        name = readLine()
                                        upperName = name!.uppercased()
                                    } while (nameArray.contains(upperName!) || upperName! == "")
                                }
                                nameArray.append(upperName!)
                                let nain = Nain(name: name!)
                                let hache = Hache()
                                nain.weapon = hache
                                // let play:[Any] = [nain.name, nain.pointOfLife, nain.weapon.name]
                                print("Voici \(name!), le nain à \(nain.pointOfLife) points de vie et possède une \(hache.name) dont les dommages coûtent \(hache.damage) points")
                                myTeam.append(nain)
                           
                            default:
                                print("Choisissez bien parmi les personnages proposés !")
                                } // fin du switch choice
                            } //fin du if var
                        } // fin de la boucle creation de 3 personages
                    return myTeam
                }// fin du CreateTeam
    
    func affichage() -> String {
       return colosse.name
    }
    
    
    
    
    func Resurrect(player: Player) -> Int {
         let sceptre = Sceptre()
        player.pointOfLife = player.pointOfLife + sceptre.damage
        print ("Vous venez de recupérer \(sceptre.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
        return player.pointOfLife
    }
    
    func Hit(player: Player, weapon: Weapon) -> Int {
        let lance = Lance()
        let hache = Hache()
         let epee = Epee()
        if weapon.name == "hache" {
            player.pointOfLife = player.pointOfLife - hache.damage
            print("Vous venez de perdre \(hache.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return player.pointOfLife
        }else if weapon.name == "lance" {
           player.pointOfLife = player.pointOfLife - lance.damage
            print("Vous venez de perdre \(lance.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return player.pointOfLife
        }else{
            player.pointOfLife = player.pointOfLife - epee.damage
            print("Vous venez de perdre \(epee.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Votre personnage est malheureusement décédé des suites de ses plessures!")
            }else{
                print("Ne vous laissez abattre ! Votre tour arrive")
            }
            return player.pointOfLife
        }
    }
    
    
    func IsDead(player: Player) -> Bool  {
        var isDead = false
        if player.pointOfLife <= 0 {
            isDead = true
        }
        return isDead
    }
    }// Fin de la class

