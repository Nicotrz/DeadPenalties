//
//  main.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

import Darwin

var myGame = Game()
var choices: [String]
var introduction: String
var userChoice: Int

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
                    print()
                    return result
                }
            }
        }
        print("\n\nError! WRONG CHOICE!\n\nPlease enter one of the option:\n")
    }
    stopError()
    return 999
}

//This function ask the user to enter a text. If the input is empty, hje ask again until there is something
func askUserText(introduction: String) -> String {
    var result = ""
    while result == "" {
        print(introduction)
        if let inputText = readLine() {
            if inputText != "" {
                result = inputText
                return result
            }
        }
    }
    stopError()
    return "ERROR"
}

//This function is called when the program encounter an unexpected error
func stopError() {
    print("The program encounter an inexpected error. Please try again")
    exit(2)
}
//The game Start Here with the main menu
introduction = "Welcome to the Game Dead Penalties. Are you ready to start a new Game ?"
choices = ["1. Yeah let's fight! I'm ready!", "2. Well...I'm not sure...I Better leave here.."]
userChoice = askUserInput(introduction:introduction , myChoices: choices)

switch userChoice {
case 1:
    print("Starting the game then!")
case 2:
    print("Goodbye!")
    exit(0)
default:
    stopError()
}

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
        myGame.addCharacter(ofPlayer: player, type: "Fighter", name:name )
    }
    print("\n\nAlright \(myGame.getPlayerName(ofPlayer: player)), here is a quick summary of you're team:")
    for character in 1...Character.numberOfCharacters {
        print("\(myGame.getCharacterName(ofPlayer: player, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: player, ofCharacter: character))")
    }
    }

print("\n\n\nPlayer 1, it is your turn")

for player in 1...Game.numberOfPlayer {
    for character in 1...Character.numberOfCharacters {
        var caracteristics = myGame.getCharacterCaracteristicArray(ofPlayer: player, ofCharacter: character)
        print("Name of the character:\(caracteristics["name"]!)")
    }
}
