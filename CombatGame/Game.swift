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
    private var friendlyPlayer = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword()) // use to take one player
    private var opponentPlayer = Player(name: "", type: PlayerType.colosse,  pointOfLife: 0, weapon: Sword()) // use to take a player in the other team
    private var firstTeam: [Player] = [] // first team
    private var secondTeam: [Player] = [] // second team
    private var indexPlayerForExchange = 0 // variable using for keep in memory the player which is changed of team
    private var round = 0 // Determine the numbers of rounds in combat game
    private let randomIntWeapon = Int.random(in: 1..<3) // create a random Int for the weapon exchange and put it in a constant to determine the round it will be play
    private let randomIntPlayer = Int.random(in: 4..<6) // create a random Int for the bonus and put it in a constant to determine the round it will be play
    private var teamsArray: [[Player]] = [[]]
    // MARK - function to create players and teams
    public func CreateGame(){
        for i in 1 ... 2 {
            print("Vous êtes l'équipe \(i) à jouer. Quelle est votre nom d'équipe?")
            secondTeam = CreateTeam()
            if i == 1 {
                firstTeam = secondTeam
            }
            myTeam.append(secondTeam)
        }
    }
    
    // function to determine the uniqueless of the name of each player
    private func NamePlayerUniqueness() -> String {
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
    
    // function to determine the uniqueless of the name of each team
    private func TeamNameUniqueness()-> String {
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
        return teamName!
    }
    
    // Verify that the input is an Int
    private func IsStringAnInt(string: String) -> Bool{
        var isInt = false
        if Int(string) != nil{
            isInt = true
        }
        return isInt
    }
    
    // function verifying the input
    private func VerifyInput(array: [Any]) -> String {
        var choice: String? = readLine()
        if (!IsStringAnInt(string: choice!) || choice! == "" || choice! == "0" || !(Int(choice!)! <= (array.count)))   {
            repeat{
                print("Veuillez choisir un de vos joueurs")
                choice = readLine()
            }while(!IsStringAnInt(string: choice!) || (choice! == "" || choice! == "0") || !(Int(choice!)! <= (array.count)))
        }
        return choice!
    }
    
    // function displaying the tree choice
    private func DisplayChoicePlayer(index: Int) -> [PlayerType]{
        if index == 1 {
            print("Quel est votre premier personnage?")
        }else if index == 2{
            print("Quel est votre deuxième personnage?")
        }else{
            print("Enfin quel est votre troisième personnage?")
        }
        var playerArray = [PlayerType.combattant, PlayerType.mage, PlayerType.colosse, PlayerType.nain]
        for indexPlayerArray in 0 ... 3 {
            print("\(indexPlayerArray + 1). \(playerArray[indexPlayerArray])")
        }
        return playerArray
    }
    
    // function to create team
    private func CreateTeam() -> [Player] {
        print("Bienvenue \(TeamNameUniqueness())")
        var myTeam: [Player] = []
        for i in 1 ... 3 {
            switch VerifyInput(array: DisplayChoicePlayer(index: i)) {
            case "1":
                let combattant = Fighter(name: NamePlayerUniqueness())
                print("Voici \(combattant.name), le combattants à \(combattant.pointOfLife) point de vie et possède une \(combattant.weapon.name) dont les dommages coûtent \(combattant.weapon.damage) points")
                myTeam.append(combattant)
            case "2":
                let mage = Wizard(name: NamePlayerUniqueness())
                print("Voici \(mage.name), le mage à \(mage.pointOfLife) points de vie et a le pouvoir de sauver vos personnages grâce à son \(mage.weapon.name) qui redonne \(abs(mage.weapon.damage)) points")
                myTeam.append(mage)
            case "3":
                let colosse = Colossus(name: NamePlayerUniqueness())
                print("Voici \(colosse.name), le colosse à \(colosse.pointOfLife) points de vie et possède une \(colosse.weapon.name) dont les dommages coûtent \(colosse.weapon.damage) points")
                myTeam.append(colosse)
            case "4":
                let nain = Dwarf(name: NamePlayerUniqueness())
                print("Voici \(nain.name), le nain à \(nain.pointOfLife) points de vie et possède une \(nain.weapon.name) dont les dommages coûtent \(nain.weapon.damage) points")
                myTeam.append(nain)
            default:
                print("Choisissez bien parmi les personnages proposés !")
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
        var choice = VerifyInput(array: myTeam)
        if AskForANoDeadPlayer(myTeam: myTeam,indexPlayer: (Int(choice)! - 1)) {
            repeat{
                choice = VerifyInput(array: myTeam)
            }while ((choice == "" || choice == "0") || !(Int(choice)! <= (myTeam.count)))
        }
        player = myTeam[(Int(choice)! - 1)]
        indexPlayerForExchange = Int(choice)! - 1
        return player
    }
    
    // function asking if the player is still alive or not
    private func AskForANoDeadPlayer(myTeam: [Player], indexPlayer: Int) -> Bool {
        var isDead = false
        if myTeam[indexPlayer].IsDead(player: myTeam[indexPlayer]){
            print("Ce personnage est décédé, vous devez en choisir un autre ")
            isDead = true
        }
        return isDead
    }
    
    // MARK - function for RandomWeapon
    // function for exchange the weapon with an other one
    private func ExchangeYourWeapon(player: Player) -> Player {
        var weaponArray = [WeaponType.epee, WeaponType.hache, WeaponType.lance]
        var weaponDamageArray = [10, 15, 20]
        if !(player is Wizard){
            print("Avec quelle arme voulez-vous échanger?")
            for indexArray in 0 ... 2{
                print("\(indexArray + 1). \(weaponArray[indexArray])")
            }
            let choice = VerifyInput(array: weaponArray)
            player.weapon.name = weaponArray[Int(choice)! - 1]
            player.weapon.damage = weaponDamageArray[Int(choice)! - 1]
        }
        return player
    }
    
    // function for the random weapon excahnge in the combat
    private func RandomWeapon(player: Player){
        print("---------LE COFFRE MAGIQUE---------")
        if player.IsAFighter(player: player) {
            print("\(ExchangeYourWeapon(player: player).name) est désormais équipé de \(player.weapon.name)")
        }else {
            
            print("\(player.ImproveYourScepter(player: player).name) a un nouveau sceptre qui soigne de \(player.weapon.damage) points de vie.")
        }
    }
    
    // functions displaying random weapon
    private func DisplayRandomWeapon(round: Int, player: Player){
        if (round == randomIntWeapon) {
            RandomWeapon(player: player)
        }
    }
    
    // MARK - function to care player, if wizard is choosing
    private func WizardCared(myTeam: [Player]) -> Player{
        var player = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword())
        print("Qui voulez-vous soigner?")
        for indexArray in 0 ... (myTeam.count - 1){
            print("\(indexArray + 1). \(myTeam[indexArray].name) avec \(myTeam[indexArray].pointOfLife) points de vie")
        }
        var choiceInjured: String? = readLine()
        if (!IsStringAnInt(string: choiceInjured!) || (choiceInjured! == "" || choiceInjured! == "0") || !(Int(choiceInjured!)! <= (myTeam.count))){
            repeat {
                print("Choisissez un de vos personnage à guérir: ")
                choiceInjured = readLine()
            }while (!IsStringAnInt(string: choiceInjured!) || (choiceInjured! == "" || choiceInjured! == "0") || !(Int(choiceInjured!)! <= (myTeam.count)))
        }
        
        if AskForANoDeadPlayer(myTeam: myTeam, indexPlayer: (Int(choiceInjured!)! - 1)) {
            repeat{
                choiceInjured = readLine()
            }while AskForANoDeadPlayer(myTeam: myTeam, indexPlayer: (Int(choiceInjured!)! - 1))
        }
        player = myTeam[(Int(choiceInjured!)! - 1)]
        return player
    }
    
    //MARK - functions for RandomPlayer ( BONUS )
    private func ChooseOppositePlayer(myTeam: [Player], index: Int) -> Player{
        print("---------C'EST VOTRE JOUR DE CHANCE!!---------")
        print("Choisissez parmi les joueurs de l'équipe adversaire et prenez le dans votre équipe:")
        var choicePlayer = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword())
        choicePlayer = DisplayMyTeam(myTeam: myTeam, index: index)
        return choicePlayer
    }
    
    // function returning player choosed by the firtsTeam in order to add to his team
    private func RandomPlayer(myTeam: [Player], index: Int) -> Player{
        var player = Player(name: "", type: PlayerType.colosse, pointOfLife: 0, weapon: Sword())
        player = ChooseOppositePlayer(myTeam: myTeam, index: index)
        return player
    }
    
    // function displaying random player switch
    private func DisplayRandomPlayer(i: Int, j: Int){
        if i == 0 {
            teamsArray = [firstTeam, secondTeam]
        }else if i == 1{
            teamsArray = [secondTeam, firstTeam]
        }
        if (round == randomIntPlayer){
            print("\(teamNameArray[i])")
            teamsArray[0].append(RandomPlayer(myTeam: teamsArray[1], index: j))
            teamsArray[1].remove(at: indexPlayerForExchange)
            if i == 0{
                firstTeam = teamsArray[0]
                secondTeam = teamsArray[1]
            }else if i == 1{
                secondTeam = teamsArray[0]
                firstTeam = teamsArray[1]
            }
            PrintNewTeam(myTeam: teamsArray[0], index: i)
            PrintNewTeam(myTeam: teamsArray[1], index: j)
        }
    }
    
    // function displaying the news teams
    private func PrintNewTeam(myTeam:[Player], index: Int){
        print("\(teamNameArray[index]) est désormais composée de:")
        for indexArray in 0 ... (myTeam.count - 1){
            print("\(indexArray + 1). \(myTeam[indexArray].name) avec \(myTeam[indexArray].pointOfLife) points de vie et est équipé de \(myTeam[indexArray].weapon.name).")
        }
    }
    
    // MARK - function for Combat Game
    public func CombatGame() {
        var j: Int = 0 // index of the team in the array of arrays myTeam: [[Player]] (declared line 15)
        repeat{
            for i in 0 ... 1{
                if i == 0 {
                    teamsArray = [firstTeam, secondTeam]
                    j = 1
                }else if i == 1{
                    teamsArray = [secondTeam, firstTeam]
                    j = 0
                }
                round += 1
                DisplayRandomPlayer(i: i, j: j)
                print("\(teamNameArray[i]), Choisissez votre joueur: ")
                friendlyPlayer = DisplayMyTeam(myTeam: teamsArray[0], index: i)
                DisplayRandomWeapon(round: round, player: friendlyPlayer)
                if friendlyPlayer is Wizard {
                    let mage = Wizard(name: friendlyPlayer.name)
                    mage.Resurrect(player: WizardCared(myTeam: teamsArray[0]), care: friendlyPlayer.weapon.damage)
                }else{
                    print("Choisissez votre adversaire: ")
                    opponentPlayer = DisplayMyTeam(myTeam: teamsArray[1], index: j)
                    opponentPlayer = opponentPlayer.Hit(player: opponentPlayer, weapon: friendlyPlayer.weapon)
                    
                }
                if CheckGameOver(index: i, myTeam: teamsArray[1]){
                    break
                }
            }
        }while !(IsGameOver(myTeam: teamsArray[1]))
    }
    
    // MARK - function attack or treat
    
    // MARK - Condition of Game Over
    // function to group warrior of one team
    private func FighterArray(myTeam: [Player]) -> [Player]{
        var fighterArray: [Player] = []
        for i in 0 ... (myTeam.count - 1) {
            if (myTeam[i] is Colossus || myTeam[i] is Fighter || myTeam[i] is Dwarf) {
                fighterArray.append(myTeam[i])
            }
        }
        return fighterArray
    }
    
    // function to group dead player of one team
    private func DeadFighterArray(myTeam: [Player]) -> [Player] {
        var deadFighter: [Player] = []
        for i in 0 ... (FighterArray(myTeam: myTeam).count - 1){
            if myTeam[i].IsDead(player: FighterArray(myTeam: myTeam)[i]) {
                deadFighter.append(myTeam[i])
            }
        }
        return deadFighter
    }
    
    // verify if all warrior of one team are dead
    private func AllFighterDead(myTeam: [Player]) -> Bool{
        var allDead = false
        if FighterArray(myTeam: myTeam).count == DeadFighterArray(myTeam: myTeam).count{
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
    
    // MARK - function to check if the game is over and print the winner
    private func CheckGameOver(index: Int, myTeam: [Player]) -> Bool{
        let gameOver = IsGameOver(myTeam: myTeam)
        if gameOver == true{
            print("\(teamNameArray[index]) gagne le jeu !!")
            print("Résultat: \(teamNameArray[index]) a gagné en \(round) coups")
        }
        return gameOver
    }
    
}


