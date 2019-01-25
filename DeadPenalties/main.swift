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
                    return result
                }
            }
        }
        print("Error! WRONG CHOICE!\n\nPlease enter one of the option:\n")
    }
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
    myGame.addPlayer(name: askUserText(introduction: "Player \(player), please enter your name"))
    print("Alright! We shall now call you \(myGame.getPlayerName(ofPlayer: player)) ")
    for character in 1...Character.numberOfCharacters {
        introduction = "Please Choose the type of the character number \(character). Choose carrefully, you can't change it later!\n"
        userChoice = askUserInput(introduction: introduction, myChoices: choices)
        switch userChoice {
        case 1:
            introduction = "Please enter the name of your Fighter"
            myGame.addCharacter(ofPlayer: player, type: "Fighter", name: askUserText(introduction: introduction))
        case 2:
            introduction = "Please enter the name of your Magus"
            myGame.addCharacter(ofPlayer: player, type: "Magus", name: askUserText(introduction: introduction))
        case 3:
            introduction = "Please enter the name of your Colossus"
            myGame.addCharacter(ofPlayer: player, type: "Colossus", name: askUserText(introduction: introduction))
        case 4:
            introduction = "Please enter the name of your Dwarf"
            myGame.addCharacter(ofPlayer: player, type: "Dwarf", name: askUserText(introduction: introduction))
        default:
            stopError()
        }
    }
    print("Alright \(myGame.getPlayerName(ofPlayer: player)), here is a quick summary of you're team:")
    for character in 1...Character.numberOfCharacters {
        print("\(myGame.getCharacterName(ofPlayer: player, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: player, ofCharacter: character))")
    }
    }

