//
//  Game.swift
//  CombatGame
//
//  Created by stephane verardo on 05/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Game {
    
    private var teamNameArray: [String] = []  //Use to identify each team
    private var nameArray: [String] = []   // use to identify each player
    private var myTeam: [[Player]] = []  // contains the both team
    private var frPlayer = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword()) // use to take one player
    private var opPlayer = Player(name: "", type: PlayerType.colosse,  pointOfLife: 0, weapon: Sword()) // use to take a player in the other team
    private var myTeam1: [Player] = [] // first team
    private var myTeam2: [Player] = [] // second team
    private var indexPlayerForExchange = 0 // variable using for keep in memory the player which is changed of team
    private var round = 0 // Determine the numbers of rounds in combat game
  
    // MARK - function to create players and teams
    public func CreateGame(){
        for i in 1 ... 2 {
            print("Vous êtes l'équipe \(i) à jouer. Quelle est votre nom d'équipe?")
            myTeam2 = CreateTeam()
            if i == 1 {
                myTeam1 = myTeam2
            }
            myTeam.append(myTeam2)
        }
        
       
    }
    
    
    // function to determine the uniqueless of the name
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
    
    
    // function to create team
    private func CreateTeam() -> [Player] {
       //  Name of each team
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
    
        //  Name and type for each players
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
                                let combattant = Fighter(name: NamePlayer())
                                let epee = Sword()
                                combattant.weapon = epee
                                combattant.type = PlayerType.combattant
                                print("Voici \(combattant.name), le combattants à \(combattant.pointOfLife) point de vie et possède une \(epee.name) dont les dommages coûtent \(epee.damage) points")
                                myTeam.append(combattant)
                               
                            case "2":
                                 let mage = Wizard(name: NamePlayer())
                                let sceptre = Scepter()
                                mage.weapon = sceptre
                                mage.type = PlayerType.mage
                                print("Voici \(mage.name), le mage à \(mage.pointOfLife) points de vie et a le pouvoir de sauver vos personnages grâce à son \(sceptre.name) qui redonne \(abs(sceptre.damage)) points")
                                myTeam.append(mage)
                              
                            case "3":
                                let colosse = Colossus(name: NamePlayer())
                                let lance = Spear()
                                colosse.weapon = lance
                                colosse.type = PlayerType.colosse
                                print("Voici \(colosse.name), le colosse à \(colosse.pointOfLife) points de vie et possède une \(lance.name) dont les dommages coûtent \(lance.damage) points")
                                myTeam.append(colosse)
                               
                                
                            case "4":
                                let nain = Dwarf(name: NamePlayer())
                                let hache = Chopped()
                                nain.weapon = hache
                                nain.type = PlayerType.nain
                                print("Voici \(nain.name), le nain à \(nain.pointOfLife) points de vie et possède une \(hache.name) dont les dommages coûtent \(hache.damage) points")
                                myTeam.append(nain)
                           
                            default:
                                print("Choisissez bien parmi les personnages proposés !")
                                }
                            }
                        }
                    return myTeam
                }
 
    //function for displaying in the playground the choice tree of the playing team
    private func DisplayMyTeam(myTeam: [Player], index: Int) -> Player {
        var player = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword())
        for indexArray in 0...(myTeam.count - 1){
        print("\(indexArray + 1). \(myTeam[indexArray].name) est un \(myTeam[indexArray].type) équipé de \(myTeam[indexArray].weapon.name) provoquant \(myTeam[indexArray].weapon.damage) de dégat et a \(myTeam[indexArray].pointOfLife) points de vie")
        }
        var choice: String? = readLine()
        if ((choice! == "" || choice! == "0") || !(Int(choice!)! <= (myTeam.count)))   {
            repeat{
                print("Veuillez choisir un de vos joueurs")
                choice = readLine()
            }while((choice! == "" || choice! == "0") || !(Int(choice!)! <= (myTeam.count)))
            }

            if AskForANoDeadPlayer(myTeam: myTeam,indexPlayer: (Int(choice!)! - 1)) {
                        repeat{
                            choice = readLine()
                        }while ((choice! == "" || choice! == "0") || !(Int(choice!)! <= (myTeam.count)))
                    }
        player = myTeam[(Int(choice!)! - 1)]
        indexPlayerForExchange = Int(choice!)! - 1
        return player
    }
    
    // function asking if the player is still alive or not
    private func AskForANoDeadPlayer(myTeam: [Player], indexPlayer: Int) -> Bool {
        var isDead = false
        if IsDead(player: myTeam[indexPlayer]){
                print("Ce personnage est décédé, vous devez en choisir un autre ")
                isDead = true
        }
        return isDead
    }
    
    // function asking for the type of the player: warrior OR magus
    private func IsAFighter(player: Player) -> Bool{
        var isAFighter = false
        if !(player is Wizard){
            isAFighter = true
        }
        return isAFighter
    }
    
    // MARK - function for RandomWeapon
    // function for exchange the weapon with an other one
    private func ExchangeYourWeapon(player: Player) -> Player {
        if !(player is Wizard){
            print("Avec quelle arme voulez-vous échanger?"
                + "\n1. La Lance"
                + "\n2. L'épée"
                + "\n3. La hache")
            var choice: String? = readLine()
            if !(choice == "1" || choice == "2" || choice == "3") {
                repeat{
                    print("Veuillez choisir parmi les personnages proposés !")
                    choice = readLine()!
                } while !(choice == "1" || choice == "2" || choice == "3")
            }
            switch choice{
            case "1":
                let lance = Spear()
                player.weapon = lance
            case "2":
                let epee = Sword()
                player.weapon = epee
            case "3":
                let hache = Chopped()
                player.weapon = hache
            default:
                break
            }
        }
        return player
    }
    
    // function for improve the capability of the scepter
    private func ImproveYourScepter(player: Player) -> Player {
        if(player is Wizard){
            player.weapon.damage = 20
        }
    return player
    }
    
    // function for the random weapon excahnge in the combat
    private func RandomWeapon(myTeam: [Player], player: Player){
        print("---------LE COFFRE MAGIQUE---------")
        if IsAFighter(player: player) {
            print("\(ExchangeYourWeapon(player: player).name) est désormais équipé de \(player.weapon.name)")
        }else {
            
            print("\(ImproveYourScepter(player: player).name) a un nouveau sceptre qui soigne de \(player.weapon.damage) points de vie.")
        }
    }
    
    //MARK - functions for RandomPlayer ( BONUS )
    private func ChooseOppositePlayer(myTeam: [Player], index: Int) -> Player{
        print("---------C'EST VOTRE JOUR DE CHANCE!!---------")
        print("Choisissez parmi les joueurs de l'équipe adversaire et prenez le dans votre équipe:")
        var choicePlayer = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword())
        choicePlayer = DisplayMyTeam(myTeam: myTeam, index: index)
        return choicePlayer
    }
    
    // MARK - function to care player, if wizard is choosing
    private func WizardCared(myTeam: [Player]) -> Player{
        var player = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword())
        print("Qui voulez-vous soigner?")
        for indexArray in 0 ... (myTeam.count - 1){
            print("\(indexArray + 1). \(myTeam[indexArray].name) avec \(myTeam[indexArray].pointOfLife) points de vie")
        }
        var choiceInjured: String? = readLine()
        if ((choiceInjured! == "" || choiceInjured! == "0") || !(Int(choiceInjured!)! <= (myTeam.count))){
            repeat {
                print("Choisissez un de vos personnage à guérir: ")
                choiceInjured = readLine()
            }while ((choiceInjured! == "" || choiceInjured! == "0") || !(Int(choiceInjured!)! <= (myTeam.count)))
        }
        
        if AskForANoDeadPlayer(myTeam: myTeam, indexPlayer: (Int(choiceInjured!)! - 1)) {
                repeat{
                    choiceInjured = readLine()
                }while AskForANoDeadPlayer(myTeam: myTeam, indexPlayer: (Int(choiceInjured!)! - 1))
            }
         player = myTeam[(Int(choiceInjured!)! - 1)]
        return player
    }
    
    // MARK - function to check if the game is over and print the winner
    private func CheckGameOver(index: Int, myTeam: [Player]) -> Bool{
        let gameOver = IsGameOver(myTeam: myTeam)
        if gameOver == true{
            print("\(teamNameArray[index]) gagne le jeu !!")
            print("Résultat: \(teamNameArray[index]) a gagné en \(round) coups")
        }
        return gameOver
    }
    
    // MARK - function for Combat Game
    public func CombatGame() {
        // Declaration of the methods
        var myTeam: [Player] = []
        var yourTeam: [Player] = []
            var j: Int = 0
            let randomIntWeapon = Int.random(in: 3..<6) // create a random Int for the weapon exchange and put it in a constant to determine the round it will be play
            let randomIntPlayer = Int.random(in: 7..<11) // create a random Int for the bonus and put it in a constant to determine the round it will be play
        // start of the repeat game
        repeat{
               for i in 0 ... 1{
                        if i == 0 {
                            myTeam = myTeam1
                            j = 1
                            yourTeam = myTeam2
                        }else if i == 1{
                            myTeam = myTeam2
                            j = 0
                            yourTeam = myTeam1
                        }
                round += 1
                // random for take a player at the opposite team
                if (round == randomIntPlayer){
                    print("\(teamNameArray[i])")
                    var player = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword())
                    player = ChooseOppositePlayer(myTeam: yourTeam, index: j)
                    myTeam.append(player)
                    yourTeam.remove(at: indexPlayerForExchange)
                    if i == 0 {
                        myTeam1 = myTeam
                        myTeam2 = yourTeam
                    }else if i == 1{
                        myTeam2 = myTeam
                        myTeam1 = yourTeam
                    }
                    print("\(teamNameArray[i])est désormais composée de:")
                    for indexArray in 0 ... (myTeam.count - 1){
                        print("\(indexArray + 1). \(myTeam[indexArray].name) avec \(myTeam[indexArray].pointOfLife) points de vie et est équipé de \(myTeam[indexArray].weapon.name)")
                    }
                    print("\(teamNameArray[j]) est désormais composée de:")
                    for indexArray in 0 ... (yourTeam.count - 1){
                        print("\(indexArray + 1). \(yourTeam[indexArray].name) avec \(yourTeam[indexArray].pointOfLife) points de vie et est équipé de \(yourTeam[indexArray].weapon.name)")
                    }
                }
                // fisrt team begin playing
                print("\(teamNameArray[i]), Choisissez votre joueur: ")
                frPlayer = DisplayMyTeam(myTeam: myTeam, index: i)
                // random for exchanging the weapon
                if (round == randomIntWeapon) {
                    RandomWeapon(myTeam: myTeam, player: frPlayer)
                }
                if frPlayer is Wizard {
                    Resurrect(player: WizardCared(myTeam: myTeam), care: frPlayer.weapon.damage)
                }else{
                    print("Choisissez votre adversaire: ")
                    opPlayer = DisplayMyTeam(myTeam: yourTeam, index: j)
                    opPlayer = Hit(player: opPlayer, weapon: frPlayer.weapon)
                }
                // verify if players of the team is still alive or if there is just a wizard
                if CheckGameOver(index: i, myTeam: yourTeam){
                    break
                }
                   }
             }while !(IsGameOver(myTeam: yourTeam))
        }
    
    // MARK - function attack or treat
    // function to be treat by the wizard
    private func Resurrect(player: Player, care: Int) {
        player.pointOfLife = player.pointOfLife + care
        print ("Vous venez de recupérer \(care). Vous avez désormais \(player.pointOfLife) de points de vie.")
    }
    
    // function for put damage to the opponent
    private func Hit(player: Player, weapon: Weapon) -> Player {
        if weapon is Chopped {
             player.pointOfLife = player.pointOfLife - weapon.damage
            print("Votre adversaire vient de perdre \(weapon.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
            }
        }else if weapon is Spear {
           player.pointOfLife = player.pointOfLife - weapon.damage
            print("Votre adversaire vient de perdre \(weapon.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
                
            }
        }else if weapon is Sword {
             player.pointOfLife = player.pointOfLife - weapon.damage
            print("Votre adversaire vient de perdre \(weapon.damage). Il lui reste donc désormais \(player.pointOfLife) de points de vie.")
            if IsDead(player: player){
                print("Félicitation, vous venez d'éliminer un adversaire!")
            }
        }
        return player
    }
    
    // verify if player is dead
    private func IsDead(player: Player) -> Bool  {
        var isDead = false
        if player.pointOfLife <= 0 {
            isDead = true
            player.pointOfLife = 0
        }
        return isDead
    }
    
    // MARK - Condition of Game Over
    // functino to group warrior of one team
    private func AreYouFighter(myTeam: [Player]) -> [Player]{
        var fighterArray: [Player] = []
        for i in 0 ... (myTeam.count - 1) {
            if (myTeam[i] is Colossus || myTeam[i] is Fighter || myTeam[i] is Dwarf) {
                fighterArray.append(myTeam[i])
            }
        }
        return fighterArray
    }
    
    // function to group dead player of one team
   private func AreYouADeadFighter(myTeam: [Player]) -> [Player] {
        var deadFighter: [Player] = []
        for i in 0 ... (AreYouFighter(myTeam: myTeam).count - 1){
        if IsDead(player: AreYouFighter(myTeam: myTeam)[i]) {
            deadFighter.append(myTeam[i])
            }
        }
        return deadFighter
    }
    
    // verify if all warrior of one team are dead
    private func AllFighterDead(myTeam: [Player]) -> Bool{
        var allDead = false
        if AreYouFighter(myTeam: myTeam).count == AreYouADeadFighter(myTeam: myTeam).count{
            allDead = true
        }
        return allDead
    }
    
    // verify if the game is over
    private func IsGameOver(myTeam: [Player]) -> Bool{
        var isGameOver = false
        if (AllFighterDead(myTeam: myTeam)) {
            isGameOver = true
        }
        return isGameOver
    }
}


