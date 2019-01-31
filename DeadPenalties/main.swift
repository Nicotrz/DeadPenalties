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
                    print("\u{001B}[2J")
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
                print("\u{001B}[2J")
                return result
            }
        }
    }
    stopError()
    return "ERROR"
}

//Same function as askUserInput, but specific for character choose ( It won't propose a character if he is dead )
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
                if myGame.isAllowedToHaveMagicalWeapon(ofPlayer: playertoanalyse, ofCharacter: character) {
                    print("Mana: \(myGame.getMana(ofPlayer: playertoanalyse, ofCharacter: character))")
                }
                print(myGame.getWeaponDescription(ofPlayer: playertoanalyse, ofCharacter: character) + "\n")
            }
        }
    }
}

func initGameWithRandomCharacter() {
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
        for _ in 1...Character.numberOfCharacters {
            let type = myGame.generateRandomTypeOfCharacter()
            print("The random type of character choosen is a \(type).")
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
        print("\n\n\n\nAlright \(myGame.getPlayerName(ofPlayer: player)), here is a quick summary of you're team:")
        for character in 1...Character.numberOfCharacters {
            print("\(myGame.getCharacterName(ofPlayer: player, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: player, ofCharacter: character))")
        }
        print()
    }
}

//Function for normal init of the game
func initGameNormal () {
    choices = ["1. \(Fighter.type): \n \(Fighter.description)","2. \(Magus.type): \n \(Magus.description)","3. \(Colossus.type): \n \(Colossus.description)","4. \(Dwarf.type): \n \(Dwarf.description)"]
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
                type = Fighter.type
            case 2:
                type = Magus.type
            case 3:
                type = Colossus.type
            case 4:
                type = Dwarf.type
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
        print("\n\n\n\nAlright \(myGame.getPlayerName(ofPlayer: player)), here is a quick summary of you're team:")
        for character in 1...Character.numberOfCharacters {
            print("\(myGame.getCharacterName(ofPlayer: player, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: player, ofCharacter: character))")
        }
        print()
    }
}




//Func for a complete turn of the game
func play() {
    myGame.nextPlayer()
    print("\n\n\(myGame.getPlayerName(ofPlayer: myGame.currentPlayer)), it is your turn.\n\n")
    if !(myGame.firstAction) {
        print("Summary of the last action:")
        print(myGame.resumeLastAction())
    }
    myGame.firstAction = false
    displayCarracteristics()
    introduction = "Choose your character:"
    choices.removeAll()
    for character in 1...Character.numberOfCharacters {
        choices.append("\(character). " + myGame.getCharacterName(ofPlayer: myGame.currentPlayer, ofCharacter: character))
    }
    let attacker = askUserToChooseCharacter(introduction: introduction, myChoices: choices, player: myGame.currentPlayer)
    
    if myGame.generateMagicChest() {
        myGame.generateRandomWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker)
        print("a magic chest appear! You are so lucky!\nContent: \(myGame.getRandomWeaponType(ofPlayer: myGame.currentPlayer))\n\(myGame.getRandomWeaponDescription(ofPlayer: myGame.currentPlayer))")
        introduction = "Do you want to take this weapon?"
        choices = ["1. Yes","2. No"]
        let choice = askUserInput(introduction: introduction, myChoices: choices)
        switch choice {
        case 1:
            myGame.replaceWeaponByMagicChest(ofPlayer: myGame.currentPlayer, ofCharacter: attacker)
            print("Weapon Replaced!")
        case 2:
            print("Nothing done")
        default:
            stopError()
        }
        displayCarracteristics()
    }
    
    
    if myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker ) {
        introduction = "Choose the member to heal:"
    } else {
        introduction = "Choose your opponent:"
    }
    
    var opponentPlayer = 0
    choices.removeAll()
    for (index,_) in myGame.players.enumerated() {
        let playerToAnalize = index + 1
        if  ( ( playerToAnalize != myGame.currentPlayer ) && ( !myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker) ) ) || ( ( myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker ) ) && ( playerToAnalize == myGame.currentPlayer ) ) {
            opponentPlayer = playerToAnalize
            for character in 1...Character.numberOfCharacters {
                choices.append("\(character). " + myGame.getCharacterName(ofPlayer: playerToAnalize, ofCharacter: character))
            }
        }
    }
    
    
    let opponent = askUserToChooseCharacter(introduction: introduction, myChoices: choices, player: opponentPlayer)
    
    if !myGame.attack(attackerPlayer: myGame.currentPlayer, attackerCharacter: attacker, opponentPlayer: opponentPlayer, opponentCharacter: opponent) {
        print("\u{001B}[2J")
        print("\(myGame.getPlayerName(ofPlayer: myGame.currentPlayer)), You don't have enought mana! The action has failed!\n\n\n\n")
    } else {
        print("\u{001B}[2J")
    }
}






//The game Start Here with the main menu
introduction = "\n\n\nWelcome to the Game Dead Penalties. Are you ready to start a new Game ?\n\n"
choices = ["1. Yeah let's fight! I'm ready!", "2. Begin a new game with random characters", "3. Well...I'm not sure...I Better leave here.." ]
userChoice = askUserInput(introduction:introduction , myChoices: choices)

switch userChoice {
case 1:
    initGameNormal()
case 2:
    initGameWithRandomCharacter()
case 3:
    print("Goodbye!")
    exit(0)
default:
    stopError()
}


//The game begin
while !myGame.checkIfGameIsFinished() {
play()
}

print("The Game is finished! \(myGame.getPlayerName(ofPlayer: myGame.currentPlayer)) is the winner!\n\nYou played for \(myGame.nbOfTurn) turns.")
