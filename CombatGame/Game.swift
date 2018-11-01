//
//  Game.swift
//  CombatGame
//
//  Created by stephane verardo on 05/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Game {
    
    private var teamNameArray: [String] = []
    private var nameArray: [String] = []
    private var myTeam: [[Player]] = []
    private var frPlayer = Player(name: "", type: "", pointOfLife: 0, weapon: Epee())
    private var opPlayer = Player(name: "", type: "",  pointOfLife: 0, weapon: Epee())
    private var myTeam1: [Player] = []
    private var myTeam2: [Player] = []
    
  
    public func CreateGame() -> [Player]{
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
    
   private func NamePlayer() -> String {
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
        return name!
    }
    
    private func CreateTeam() -> [Player] {
        
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
                                let combattant = Combattant(name: NamePlayer())
                                let epee = Epee()
                                combattant.weapon = epee
                                combattant.type = "combattant"
                                print("Voici \(combattant.name), le combattants à \(combattant.pointOfLife) point de vie et possède une \(epee.name) dont les dommages coûtent \(epee.damage) points")
                                myTeam.append(combattant)
                               
                            case "2":
                                 let mage = Mage(name: NamePlayer())
                                let sceptre = Sceptre()
                                mage.weapon = sceptre
                                mage.type = "mage"
                                print("Voici \(mage.name), le mage à \(mage.pointOfLife) points de vie et a le pouvoir de sauver vos personnages grâce à son \(sceptre.name) qui redonne \(abs(sceptre.damage)) points")
                                myTeam.append(mage)
                              
                            case "3":
                                let colosse = Colosse(name: NamePlayer())
                                let lance = Lance()
                                colosse.weapon = lance
                                colosse.type = "colosse"
                                print("Voici \(colosse.name), le colosse à \(colosse.pointOfLife) points de vie et possède une \(lance.name) dont les dommages coûtent \(lance.damage) points")
                                myTeam.append(colosse)
                               
                                
                            case "4":
                                let nain = Nain(name: NamePlayer())
                                let hache = Hache()
                                nain.weapon = hache
                                nain.type = "nain"
                                print("Voici \(nain.name), le nain à \(nain.pointOfLife) points de vie et possède une \(hache.name) dont les dommages coûtent \(hache.damage) points")
                                myTeam.append(nain)
                           
                            default:
                                print("Choisissez bien parmi les personnages proposés !")
                                } // fin du switch choice
                            } //fin du if var
                        } // fin de la boucle creation de 3 personages
                    return myTeam
                }// fin du CreateTeam
 
    private func DisplayMyTeam(index: Int) -> Player {
        var myTeam: [Player] = []
        var player = Player(name: "", type: "", pointOfLife: 0, weapon: Epee())
        if index == 0{
            myTeam = myTeam1
        }else if index == 1{
            myTeam = myTeam2
        }
        print(  "1. \(myTeam[0].name) est un \(myTeam[0].type) équipé de \(myTeam[0].weapon.name) provoquant \(myTeam[0].weapon.damage) de dégat et a \(myTeam[0].pointOfLife) points de vie"
            + "\n2. \(myTeam[1].name) est un \(myTeam[1].type) équipé de \(myTeam[1].weapon.name) provoquant \(myTeam[1].weapon.damage) de dégat et a \(myTeam[1].pointOfLife) points de vie"
            + "\n3. \(myTeam[2].name) est un \(myTeam[2].type) équipé de \(myTeam[2].weapon.name) provoquant \(myTeam[2].weapon.damage) de dégat et a \(myTeam[2].pointOfLife) points de vie")
        var choice: String? = readLine()
        if !(choice == "1" || choice == "2" || choice == "3"){
            repeat{
                print("Veuillez choisir un de vos joueurs")
                choice = readLine()
            }while(!(choice == "1" || choice == "2" || choice == "3"))
            }
            switch choice {
            case "1": if AskForANoDeadPlayer(indexTeam: index, indexPlayer: (Int(choice!)! - 1)) {
                        repeat{
                            choice = readLine()
                        }while (choice == "1")
                    }
            case "2":
                if AskForANoDeadPlayer(indexTeam: index, indexPlayer: (Int(choice!)! - 1)) {
                        repeat{
                            choice = readLine()
                        }while (choice == "2")
                        }
            case "3":
                if AskForANoDeadPlayer(indexTeam: index, indexPlayer: (Int(choice!)! - 1)) {
                        repeat{
                            choice = readLine()
                        }while (choice == "3")
                        }
             default:
                break
            }
        player = myTeam[(Int(choice!)! - 1)]
        return player
    }
    
    
   private func AskForANoDeadPlayer(indexTeam: Int, indexPlayer: Int) -> Bool {
        var isDead = false
        var myTeam: [Player] = []
        if indexTeam == 0 {
            myTeam = myTeam1
        }else if indexTeam == 1{
            myTeam = myTeam2
        }
        if IsDead(player: myTeam[indexPlayer]){
                print("Ce personnage est décédé, vous devez en choisir un autre ")
                isDead = true
        }
        return isDead
    }
    
    private func IsAFighter(myTeam: [Player], index: Int) -> Bool{
        var isAFighter = false
        if !(myTeam[index] is Mage){
            isAFighter = true
        }
        return isAFighter
    }
    
    private func ExchangeYourWeapon(player: Player) -> Player {
        if !(player is Mage){
            print("Avec quelle arme voulez-vous échanger?"
                + "\n1. La Lance"
                + "\n2. L'épée"
                + "\n3. La hache")
            var choice: String? = readLine()
            if !(choice == "1" || choice == "2" || choice == "3") {
                repeat{
                    print("Veuillez choisir parmi les personnages proposés !")
                    choice = readLine()!
                } while (!(choice == "1" || choice == "2" || choice == "3"))
            }
            switch choice{
            case "1":
                let lance = Lance()
                player.weapon = lance
            case "2":
                let epee = Epee()
                player.weapon = epee
            case "3":
                let hache = Hache()
                player.weapon = hache
            default:
                break
            }
        }
        return player
    }
    
    private func ImproveYourScepter(player: Player) -> Player{
        if(player is Mage){
            player.weapon.damage = 25
        }
    return player
    }
    
    private func RandomPlay(myTeam: [Player]){
        print("---------LE COFFRE MAGIQUE--------- "
            + "\nChoisissez le personnage qui en bénéficiera:"
            + "\n1. \(myTeam[0].name)"
            + "\n2. \(myTeam[1].name)"
            + "\n3. \(myTeam[2].name)")
        var choice: String? = readLine()
        if !(choice == "1" || choice == "2" || choice == "3") {
            repeat{
                print("Veuillez choisir parmi les personnages proposés !")
                choice = readLine()!
            } while (!(choice == "1" || choice == "2" || choice == "3"))
        }
        
        if IsAFighter(myTeam: myTeam, index: (Int(choice!)! - 1)){
                ExchangeYourWeapon(player: myTeam[(Int(choice!)! - 1)])
                print("\(myTeam[(Int(choice!)! - 1)].name) est désormais équipé de \(myTeam[(Int(choice!)! - 1)].weapon.name)")
        }else {
            ImproveYourScepter(player: myTeam[(Int(choice!)! - 1)])
            print("\(myTeam[(Int(choice!)! - 1)].name) a un nouveau sceptre qui soigne de \(myTeam[(Int(choice!)! - 1)].weapon.damage) points de vie.")
        }
        
        
    }
    
    public func CombatGame() {
        var myTeam: [Player] = []
        var deadTeam: [Player] = []
            var j: Int = 0
            let randomInt = Int.random(in: 1..<3)
            var turn = 0
            repeat{
               for i in 0 ... 1{
                        if i == 0 {
                            myTeam = myTeam1
                            j = 1
                            deadTeam = myTeam2
                        }else if i == 1{
                            myTeam = myTeam2
                            j = 0
                            deadTeam = myTeam1
                        }
                turn += 1
                print("\(teamNameArray[i]), Choisissez votre joueur: ")
                if turn == randomInt{
                    RandomPlay(myTeam: myTeam)
                }else{
                frPlayer = DisplayMyTeam(index: i)
                    if frPlayer is Mage {
                    var player = Player(name: "", type: "", pointOfLife: 0, weapon: Epee())
                    print("Qui voulez-vous soigner?"
                        + "\n1. \(myTeam[0].name) avec \(myTeam[0].pointOfLife) points de vie"
                        + "\n2. \(myTeam[1].name) avec \(myTeam[1].pointOfLife) points de vie"
                        + "\n3. \(myTeam[2].name) avec \(myTeam[2].pointOfLife) points de vie"
                    )
                    var choiceInjured: String? = readLine()
                        if !( choiceInjured == "1" || choiceInjured == "2" || choiceInjured == "3"){
                            repeat {
                                print("Choisissez un de vos personnage à guérir: ")
                                choiceInjured = readLine()
                            }while (!( choiceInjured == "1" || choiceInjured == "2" || choiceInjured == "3"))
                        }
                    
                            switch choiceInjured {
                            case "1":
                                if AskForANoDeadPlayer(indexTeam: i, indexPlayer: (Int(choiceInjured!)! - 1)) {
                                repeat{
                                        choiceInjured = readLine()
                                    }while (choiceInjured == "1")
                                }
                         case "2":
                                if AskForANoDeadPlayer(indexTeam: i, indexPlayer: (Int(choiceInjured!)! - 1)) {
                                    repeat{
                                        choiceInjured = readLine()
                                    }while (choiceInjured == "2")
                                }
                          case "3":
                                if AskForANoDeadPlayer(indexTeam: i, indexPlayer: (Int(choiceInjured!)! - 1)) {
                                    repeat{
                                        choiceInjured = readLine()
                                    }while (choiceInjured == "3")
                                }
                           default:
                                break
                            }
                    player = myTeam[(Int(choiceInjured!)! - 1)]
                        Resurrect(player: player, care: frPlayer.weapon.damage)
                }else{
                    print("Choisissez votre adversaire: ")
                    opPlayer = DisplayMyTeam(index: j)
                    opPlayer = Hit(player: opPlayer, weapon: frPlayer.weapon)
                    
                    }
                        let gameOver = IsGameOver(myTeam: deadTeam)
                        if gameOver == true{
                            print("\(teamNameArray[j])  gagne le jeu !!")
                            break
                        }
                   }
                }
                
            }while !(IsGameOver(myTeam: deadTeam))
        }
    
    // MARK - function attack or treat
    private func Resurrect(player: Player, care: Int) {
        player.pointOfLife = player.pointOfLife + care
        print ("Vous venez de recupérer \(care). Vous avez désormais \(player.pointOfLife) de points de vie.")
    }
    
    private func Hit(player: Player, weapon: Weapon) -> Player {
        if weapon is Hache {
             player.pointOfLife = player.pointOfLife - weapon.damage
            print("Votre adversaire vient de perdre \(weapon.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
            }
        }else if weapon is Lance {
           player.pointOfLife = player.pointOfLife - weapon.damage
            print("Votre adversaire vient de perdre \(weapon.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
                
            }
        }else if weapon is Epee {
             player.pointOfLife = player.pointOfLife - weapon.damage
            print("Votre adversaire vient de perdre \(weapon.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
            }
        }
        return player
    }
    
    
    private func IsDead(player: Player) -> Bool  {
        var isDead = false
        if player.pointOfLife <= 0 {
            isDead = true
            player.pointOfLife = 0
        }
        return isDead
    }
    
    // MARK - Condition of Game Over
    private func AreYouFighter(myTeam: [Player]) -> [Player]{
        var fighterArray: [Player] = []
        for i in 0 ... (myTeam.count - 1) {
            if (myTeam[i] is Colosse || myTeam[i] is Combattant || myTeam[i] is Nain) {
                fighterArray.append(myTeam[i])
            }
        }
        return fighterArray
    }
    
   private func AreYouADeadFighter(myTeam: [Player]) -> [Player] {
        var deadFighter: [Player] = []
        for i in 0 ... (AreYouFighter(myTeam: myTeam).count - 1){
        if IsDead(player: AreYouFighter(myTeam: myTeam)[i]) {
            deadFighter.append(myTeam[i])
            }
        }
        return deadFighter
    }
    
    private func AllFighterDead(myTeam: [Player]) -> Bool{
        var allDead = false
        if AreYouFighter(myTeam: myTeam).count == AreYouADeadFighter(myTeam: myTeam).count{
            allDead = true
        }
        return allDead
    }
    
    private func IsGameOver(myTeam: [Player]) -> Bool{
        var isGameOver = false
        if (AllFighterDead(myTeam: myTeam)) {
            isGameOver = true
        }
        return isGameOver
    }
}


