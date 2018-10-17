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
    var frPlayer = Player(name: "", type: "", pointOfLife: 0, weapon: Epee())
    var opPlayer = Player(name: "", type: "",  pointOfLife: 0, weapon: Epee())
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
                                combattant.type = "combattant"
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
                                mage.type = "mage"
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
                                colosse.type = "colosse"
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
                                nain.type = "nain"
                                print("Voici \(name!), le nain à \(nain.pointOfLife) points de vie et possède une \(hache.name) dont les dommages coûtent \(hache.damage) points")
                                myTeam.append(nain)
                           
                            default:
                                print("Choisissez bien parmi les personnages proposés !")
                                } // fin du switch choice
                            } //fin du if var
                        } // fin de la boucle creation de 3 personages
                    return myTeam
                }// fin du CreateTeam
    
    func ChoiceFriendlyPlayer()  {
        // Le mage ne peut pas combattre
         print(     "1. \(myTeam1[0].name) est un \(myTeam1[0].type) équipé de \(myTeam1[0].weapon.name) provoquant \(myTeam1[0].weapon.damage) de dégat et a \(myTeam1[0].pointOfLife) points de vie"
                + "\n2. \(myTeam1[1].name) est un \(myTeam1[1].type) équipé de \(myTeam1[1].weapon.name) provoquant \(myTeam1[1].weapon.damage) de dégat et a \(myTeam1[1].pointOfLife) points de vie"
                + "\n3. \(myTeam1[2].name) est un \(myTeam1[2].type) équipé de \(myTeam1[2].weapon.name) provoquant \(myTeam1[2].weapon.damage) de dégat et a \(myTeam1[2].pointOfLife) points de vie")
        var friendlyPlayer: String? = readLine()
        if !(friendlyPlayer == "1" || friendlyPlayer == "2" || friendlyPlayer == "3") || friendlyPlayer == ""{
            repeat{
                print("Veuillez choisir un de vos joueurs")
                friendlyPlayer = readLine()
            }while(!(friendlyPlayer == "1" || friendlyPlayer == "2" || friendlyPlayer == "3") || friendlyPlayer == "")
        }else {
            
                switch friendlyPlayer {
                case "1":
                    frPlayer = myTeam1[0]
                case "2":
                    frPlayer = myTeam1[1]
                case "3":
                    frPlayer = myTeam1[2]
                default:
                    break
                }
        }
        }
    
    
        func ChoiceOppositePlayer() {
        print(    "\n1. \(myTeam2[0].name) est un \(myTeam2[0].type) équipé de \(myTeam2[0].weapon.name) provoquant \(myTeam2[0].weapon.damage) de dégat et a \(myTeam2[0].pointOfLife) points de vie"
                + "\n2. \(myTeam2[1].name) est un \(myTeam2[1].type) équipé de \(myTeam2[1].weapon.name) provoquant \(myTeam2[1].weapon.damage) de dégat et a \(myTeam2[1].pointOfLife) points de vie"
                + "\n3. \(myTeam2[2].name) est un \(myTeam2[2].type) équipé de \(myTeam2[2].weapon.name) provoquant \(myTeam2[2].weapon.damage) de dégat et a \(myTeam2[2].pointOfLife) points de vie")
        var opponent: String? = readLine()
        if !(opponent == "1" || opponent == "2" || opponent == "3") || opponent == ""{
            repeat{
            print("Veuillez choisir un adversaire")
            opponent = readLine()
            } while(!(opponent == "1" || opponent == "2" || opponent == "3") || opponent == "")
            }else {
            
                switch opponent {
                case "1":
                     opPlayer = myTeam2[0]
                case "2":
                    opPlayer = myTeam2[1]
                case "3":
                    opPlayer = myTeam2[2]
                default:
                    break
                    }
                }
            }

    func CombatGame() {
            var pointOfLiveTeam1 = myTeam1[0].pointOfLife + myTeam1[1].pointOfLife + myTeam1[2].pointOfLife
            var pointOfLiveTeam2 = myTeam2[0].pointOfLife + myTeam2[1].pointOfLife + myTeam2[2].pointOfLife
        if !(pointOfLiveTeam1 == 0 || pointOfLiveTeam2 == 0){
        repeat{
            for i in 1...2 {
             print("\(teamNameArray[i-1]), Voulez-vous attaquer ou soigner?"
            + "\n1. Attaquer"
            + "\n2. Soigner")
            
            var choice: String? = readLine()
                if !(choice == "1" || choice == "2") || choice == ""{
                    repeat{
                        print("Veuillez faire un choix")
                        choice = readLine()
                        } while(!(choice == "1" || choice == "2" ) || choice == "")
                    }
                else{
                    if i == 1 {
                        if choice == "1"{
                            print("Choisissez votre personnage:")
                            ChoiceFriendlyPlayer()
                            print("Voici vos adversaire:")
                            ChoiceOppositePlayer()
                            print("Le combat commence!")
                            print(Hit(player: opPlayer, weapon: frPlayer.weapon))
                        }else{
                            ChoiceFriendlyPlayer()
                            print(Resurrect(player: frPlayer))
                                }
                    }else{
                        if choice == "1"{
                            print("Choisissez votre personnage:")
                            ChoiceOppositePlayer()
                            print("Voici vos adversaire:")
                            ChoiceFriendlyPlayer()
                            print("Le combat commence!")
                            print(Hit(player: frPlayer , weapon: opPlayer.weapon))
                        }else{
                            ChoiceOppositePlayer()
                            print(Resurrect(player: opPlayer))
                                }
                            }
                        }
                }
            }while (!(pointOfLiveTeam1 == 0 || pointOfLiveTeam2 == 0))
        }
    }
    
    
    func Resurrect(player: Player) -> Int {
         let sceptre = Sceptre()
        player.pointOfLife = player.pointOfLife + sceptre.damage
        print ("Vous venez de recupérer \(sceptre.damage). Vous avez désormais \(player.pointOfLife) de points de vie.")
        return player.pointOfLife
    }
    

    
    func Hit(player: Player, weapon: Weapon)  {
        let hache = Hache()
        let lance = Lance()
        let epee = Epee()
        if weapon.name == "hache" {
             player.pointOfLife = player.pointOfLife - hache.damage
            print("Votre adversaire vient de perdre \(hache.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
            }
        }else if weapon.name == "lance" {
           player.pointOfLife = player.pointOfLife - lance.damage
            print("Votre adversaire vient de perdre \(lance.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
            }
        }else if weapon.name == "epee" {
             player.pointOfLife = player.pointOfLife - epee.damage
            print("Votre adversaire vient de perdre \(epee.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
            }
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

