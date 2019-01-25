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

for player in 1...Game.numberOfPlayer {
    myGame.addPlayer(name: askUserText(introduction: "Player \(player), please enter your name"))
    print("Alright! We shall now call you \(myGame.getPlayerName(ofPlayer: player)) ")
    for character in 1...Character.numberOfCharacters {
        introduction = "Please Choose the type of your character. Choose carrefully, you can't change it later"
        choices = ["1.Fighter: Classic","2.Magus: Healer","3.Colossus: Monster","4.Dwarf: useless"]
        userChoice = askUserInput(introduction: introduction, myChoices: choices)
        introduction = "Please enter the name of the character number \(character)"
        switch userChoice {
        case 1:
            myGame.addCharacter(ofPlayer: player, type: "Fighter", name: askUserText(introduction: introduction))
        case 2:
            myGame.addCharacter(ofPlayer: player, type: "Magus", name: askUserText(introduction: introduction))
        case 3:
            myGame.addCharacter(ofPlayer: player, type: "Colossus", name: askUserText(introduction: introduction))
        case 4:
            myGame.addCharacter(ofPlayer: player, type: "Dwarf", name: askUserText(introduction: introduction))
        default:
            stopError()
        }
    }
    }
