//
//  main.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

import Darwin

var myGame = Game()
var choices = [String]()
var introduction = ""
var userChoice = 99

//This function ask the user to enter one of the choice available. If the input is incorrect, he ask again until the choice is correct
func askUserInput(introduction: String, myChoices: [String]) -> Int {
    var result: Int = 99
    print(introduction + "\n\n")
    while ( result > myChoices.count ) {
        for choice in myChoices {
            print(choice)
        }
        if let choice = readLine() {
            if let int = Int(choice) {
                if int <= myChoices.count && int != 0 {
                    result = int
                    //print("\u{001B}[2J")
                    return result
                }
            }
        }
        print("\n\nError! WRONG CHOICE!\n\nPlease enter one of the option:\n")
    }
    stopError()
    return 999
}

//This function ask the user to enter a text. If the input is empty, he ask again until there is something
func askUserText(introduction: String) -> String {
    var result = ""
    while result == "" {
        print(introduction)
        if let inputText = readLine() {
            if inputText != "" {
                result = inputText
                //print("\u{001B}[2J")
                return result
            }
        }
    }
    stopError()
    return "ERROR"
}

func askUserToChooseCharacter(introduction: String, myChoices: [String], player: Int ) -> Int {
    var result: Int = 99
    print(introduction + "\n\n")
    while ( result > myChoices.count ) {
        for (index,choice) in myChoices.enumerated() {
            if !myGame.getCharacterDeadStatus(ofPlayer: player, ofCharacter:index+1 ) {
            print(choice)
            }
        }
        if let choice = readLine() {
            if let int = Int(choice) {
                if int <= myChoices.count && int != 0 && !myGame.getCharacterDeadStatus(ofPlayer: player, ofCharacter: int){
                    result = int
              //      print("\u{001B}[2J")
                    return result
                }
            }
        }
        print("\n\nError! WRONG CHOICE!\n\nPlease enter one of the option:\n")
    }
    stopError()
    return 999
}


//This function is called when the program encounter an unexpected error
func stopError() {
    print("The program encounter an unexpected error. Please try again")
    exit(2)
}

//Display the characteristics of players and characters
func displayCarracteristics() {
    for (index,player) in myGame.players.enumerated() {
        let playertoanalyse = index + 1
        print("Here is the team of \(player.name):\n")
        for character in 1...Character.numberOfCharacters {
            if !myGame.getCharacterDeadStatus(ofPlayer: playertoanalyse, ofCharacter: character) {
                print("\(myGame.getCharacterName(ofPlayer: playertoanalyse, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: playertoanalyse, ofCharacter: character))")
                print("Life point:\(myGame.getCharacterLife(ofPlayer: playertoanalyse, ofCharacter: character))")
                print("Weapon:\(myGame.getCharacterWeaponName(ofPlayer: playertoanalyse, ofCharacter: character))")
                print("Dead Status:\(myGame.getCharacterDeadStatus(ofPlayer: playertoanalyse, ofCharacter: character))")
                print(myGame.getWeaponDescription(ofPlayer: playertoanalyse, ofCharacter: character) + "\n")
            }
        }
    }
}


//Function for automatic init of the game with forced players and characters
func initGameDummies() {
    myGame.addPlayer(name: "Nicolas")
    myGame.addPlayer(name: "Jo")
    myGame.addCharacter(ofPlayer: 1, type: "Magus", name: "Toto")
    myGame.addCharacter(ofPlayer: 1, type: "Fighter", name: "Saruman")
    myGame.addCharacter(ofPlayer: 1, type: "Dwarf", name: "Gimly")
    myGame.addCharacter(ofPlayer: 2, type: "Colossus", name: "Thor")
    myGame.addCharacter(ofPlayer: 2, type: "Fighter", name: "Pascal")
    myGame.addCharacter(ofPlayer: 2, type: "Dwarf", name: "Gandalf")
}

//Function for normal init of the game
func initGameNormal () {
    choices = ["1.Fighter: \n \(Fighter.description)","2.Magus: \n \(Magus.description)","3.Colossus: \n \(Colossus.description)","4.Dwarf: \n \(Dwarf.description)"]
    for player in 1...Game.numberOfPlayer {
        var nameAlreadyExist = true
        var name = ""
        while nameAlreadyExist {
            name = askUserText(introduction: "Player \(player), please enter your name")
            nameAlreadyExist = myGame.checkIfPlayerAlreadyExist(name: name)
            if nameAlreadyExist {
                print("\nThe Name \(name) as already beeen choosen. Please choose another name!")
            }
        }
        myGame.addPlayer(name: name)
        print("Alright! We shall now call you \(myGame.getPlayerName(ofPlayer: player)) ")
        for character in 1...Character.numberOfCharacters {
            introduction = "Please Choose the type of the character number \(character). Choose carrefully, you can't change it later!\n"
            userChoice = askUserInput(introduction: introduction, myChoices: choices)
            var type = ""
            switch userChoice {
            case 1:
                type = "Fighter"
            case 2:
                type = "Magus"
            case 3:
                type = "Colossus"
            case 4:
                type = "Dwarf"
            default:
                stopError()
            }
            introduction = "Please enter the name of your \(type)"
            nameAlreadyExist = true
            while nameAlreadyExist {
                name = askUserText(introduction: introduction)
                nameAlreadyExist = myGame.checkIfCharacterAlreadyExist(name: name)
                if nameAlreadyExist {
                    print("A character with the name \(name) already exist. Please choose another name")
                }
            }
            myGame.addCharacter(ofPlayer: player, type: type, name:name )
        }
        print("\n\n")
        print("\n\nAlright \(myGame.getPlayerName(ofPlayer: player)), here is a quick summary of you're team:")
        for character in 1...Character.numberOfCharacters {
            print("\(myGame.getCharacterName(ofPlayer: player, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: player, ofCharacter: character))")
        }
        print()
    }
}








//The game Start Here with the main menu
introduction = "Welcome to the Game Dead Penalties. Are you ready to start a new Game ?"
choices = ["1. Yeah let's fight! I'm ready!", "2. Well...I'm not sure...I Better leave here..","3. Launch the game in Testing Mode (skip the configuration of players and characters) "]
userChoice = askUserInput(introduction:introduction , myChoices: choices)

switch userChoice {
case 1:
    print("Starting the game then!")
    initGameNormal()
case 2:
    print("Goodbye!")
    exit(0)
case 3:
    print("Testing mode ON")
    print("I skip the config of player and character\n")
    initGameDummies()
default:
    stopError()
}


//Game structure ( BUGGY!!!! :'( )
while !myGame.checkIfGameIsFinished() {
print("Current Player:\(myGame.currentPlayer)")
print("\n\n\(myGame.getPlayerName(ofPlayer: myGame.currentPlayer)), it is your turn.\n")
displayCarracteristics()

introduction = "Choose your character:"
choices.removeAll()
for character in 1...Character.numberOfCharacters {
    choices.append("\(character). " + myGame.getCharacterName(ofPlayer: myGame.currentPlayer, ofCharacter: character))
}
let attacker = askUserToChooseCharacter(introduction: introduction, myChoices: choices, player: myGame.currentPlayer)

    if myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker ) {
        print("Choose the member to heal:")
    } else {
        print("Choose your opponent:")
    }
var opponentPlayer = 0
introduction = "Please make a choice:"
choices.removeAll()
    for (index,player) in myGame.players.enumerated() {
        let playerToAnalize = index + 1
        if  ( ( playerToAnalize != myGame.currentPlayer ) && ( !myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker) ) ) || ( ( myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker ) ) && ( playerToAnalize == myGame.currentPlayer ) ) {
            opponentPlayer = playerToAnalize
            print("Team of: \(player.name)")
        for character in 1...Character.numberOfCharacters {
            choices.append("\(character). " + myGame.getCharacterName(ofPlayer: playerToAnalize, ofCharacter: character))
            }
    }
}
let opponent = askUserToChooseCharacter(introduction: introduction, myChoices: choices, player: opponentPlayer)

    print("AttackerPlayer:\(myGame.getPlayerName(ofPlayer: myGame.currentPlayer))\nattackerCharacter:\(myGame.getCharacterName(ofPlayer: myGame.currentPlayer, ofCharacter: attacker)) ")
    print("OpponentPlayer:\(myGame.getPlayerName(ofPlayer: opponentPlayer))\nopponentCharacter:\(myGame.getCharacterName(ofPlayer: opponentPlayer, ofCharacter: opponent)) ")
    myGame.attack(attackerPlayer: myGame.currentPlayer, attackerCharacter: attacker, opponentPlayer: opponentPlayer, opponentCharacter: opponent)
displayCarracteristics()
print("State of the game: Finished? : \(myGame.checkIfGameIsFinished())")
if myGame.currentPlayer == Game.numberOfPlayer {
    myGame.currentPlayer = 1
} else {
    myGame.currentPlayer += 1
}
}
