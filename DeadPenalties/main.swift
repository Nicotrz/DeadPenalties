//
//  main.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

import Foundation
import Darwin

func clearScreen() {
    let clearScreen = Process()
    clearScreen.launchPath = "/usr/bin/clear"
    clearScreen.arguments = []
    clearScreen.launch()
    clearScreen.waitUntilExit()
}

//Instance of an object Game
var myGame = Game()

//This variable is used to give the user the choices for the menu displayed in the game
var choices = [String]()

//This variable is used for the same purpose as choices. But this is the introduction text of each menu
var introduction = ""

//Takes the result of the multiple choice on each question
var userChoice = 99

//This function ask the user to enter one of the choice available. If the input is incorrect, he ask again until the choice is correct
func askUserInput(introduction: String, myChoices: [String]) -> Int {
    //This variable will takes the input from the user. We gives it 99 so it enters to the first while whitout error.
    var result: Int = 99
    print(introduction + "\n\n")
    
    //While the choice is out of range, we keep asking for it.
    while ( result > myChoices.count ) {
        //We show the choices available
        for choice in myChoices {
            print(choice)
        }
        
        //If the choice is not empty, and is in the range allowed, we can return it.
        if let choice = readLine() {
            if let int = Int(choice) {
                if int <= myChoices.count && int != 0 {
                    result = int
                    clearScreen()
                    return result
                }
            }
        }
        print("\n\nError! WRONG CHOICE!\n\nPlease enter one of the option:\n")
    }
    //Out of range. The program shouldn't come here => Error
    stopError()
    return 999
}

//Same function as askUserInput, but specific for character choose ( It won't propose a character if he is dead )
func askUserToChooseCharacter(introduction: String, myChoices: [String], player: Int ) -> Int {
    var result: Int = 99
    print(introduction + "\n\n")
    while ( result > myChoices.count ) {
        for (index,choice) in myChoices.enumerated() {
            //The tab begin at 0 for index. So we need to give him 1 more
            let character = index + 1
            //This is the change. getCharacterDeadStatus will return true if the character is dead. we don't show it if this is the case
            if !myGame.getCharacterDeadStatus(ofPlayer: player, ofCharacter:character ) {
                print(choice)
            }
        }
        if let choice = readLine() {
            if let int = Int(choice) {
                //We check if the character choose is not dead ( OUT OF RANGE since it doesn't show up on the menu) or out of choices. If everything is ok, we can return the result
                if int <= myChoices.count && int != 0 && !myGame.getCharacterDeadStatus(ofPlayer: player, ofCharacter: int){
                    result = int
                    return result
                }
            }
        }
        print("\n\nError! WRONG CHOICE!\n\nPlease enter one of the option:\n")
    }
    //out of range. the game shouldn't come here. If he does => exit with error
    stopError()
    return 999
}

//This function ask the user to enter a text. If the input is empty, he ask again until there is something in the result ( basicaly anything)
func askUserText(introduction: String) -> String {
    var result = ""
    while result == "" {
        print(introduction)
        if let inputText = readLine() {
            if inputText != "" {
                result = inputText
                clearScreen()
                return result
            }
        }
    }
    stopError()
    return "ERROR"
}




//This function is called when the program encounter an unexpected error
func stopError() {
    print("The program encounter an unexpected error. Please try again")
    exit(2)
}

//Display the characteristics of players and characters
func displayCarracteristics() {
    //For each player
    for (index,player) in myGame.players.enumerated() {
        //We give 1 to match the user number with the index
        let playertoanalyse = index + 1
        print("Here is the team of \(player.name):\n")
        //For each character of the player
        for character in 1...Character.numberOfCharacters {
            //If the character is not dead, show his caracteristics
            if !myGame.getCharacterDeadStatus(ofPlayer: playertoanalyse, ofCharacter: character) {
                print("\(myGame.getCharacterName(ofPlayer: playertoanalyse, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: playertoanalyse, ofCharacter: character))")
                print("Life point:\(myGame.getCharacterLife(ofPlayer: playertoanalyse, ofCharacter: character)) / \(myGame.getCharacterStartingLifePoint(ofPlayer: playertoanalyse, ofCharacter: character))")
                print("Weapon:\(myGame.getCharacterWeaponName(ofPlayer: playertoanalyse, ofCharacter: character))")
                //If the character have magical power, we can show his Mana points as well.
                if myGame.isAllowedToHaveMagicalWeapon(ofPlayer: playertoanalyse, ofCharacter: character) {
                    print("Mana: \(myGame.getMana(ofPlayer: playertoanalyse, ofCharacter: character)) / 100")
                }
                print(myGame.getWeaponDescription(ofPlayer: playertoanalyse, ofCharacter: character) + "\n")
            }
        }
    }
}


//Function to add the player
func addPlayer(player: Int) {
    //The name choose already exist until we proved otherwise
    var nameAlreadyExist = true
    var name = ""
    while nameAlreadyExist {
        //Asking the name of the player and checking if it exist.
        name = askUserText(introduction: "Player \(player), please enter your name")
        nameAlreadyExist = myGame.checkIfPlayerAlreadyExist(name: name)
        if nameAlreadyExist {
            print("\nThe Name \(name) as already beeen choosen. Please choose another name!")
        }
    }
    //If we arrive here, everything is fine, we can add the player.
    myGame.addPlayer(name: name)
}

//Function to add character
func addCharacter(player: Int, type: String) {
    var nameAlreadyExist = true
    var name = ""
    while nameAlreadyExist {
        name = askUserText(introduction: introduction)
        nameAlreadyExist = myGame.checkIfCharacterAlreadyExist(name: name)
        if nameAlreadyExist {
            print("A character with the name \(name) already exist. Please choose another name")
        }
    }
    //Everything is ok. We can add it
    myGame.addCharacter(ofPlayer: player, type: type, name:name )
}

//Function to show a quick summary of the team ( just the basic: name and type)
func showSumarry(player: Int) {
    print("\n\n\n\nAlright \(myGame.getPlayerName(ofPlayer: player)), here is a quick summary of you're team:")
    for character in 1...Character.numberOfCharacters {
        print("\(myGame.getCharacterName(ofPlayer: player, ofCharacter: character)) the \(myGame.getCharacterType(ofPlayer: player, ofCharacter: character))")
    }
}

//This function init a new game with random characters (but the user still have to choose the names)
func initGameWithRandomCharacter() {
    //For each player..
    for player in 1...Game.numberOfPlayer {
        addPlayer(player: player)
        print("Alright! We shall now call you \(myGame.getPlayerName(ofPlayer: player)) ")
        //We now have to add the characters
        for _ in 1...Character.numberOfCharacters {
            //We generate the type, then ask the name on the addCharacter function
            let type = myGame.generateRandomTypeOfCharacter()
            print("The random type of character choosen is a \(type).")
            introduction = "Please enter the name of your \(type)"
            addCharacter(player: player, type: type)
        }
        //Every character has been added, quick summary..
        showSumarry(player: player)
        print()
    }
}

//Function for normal init of the game
func initGameNormal () {
    //We will display all the available types ( this variable won't change, so it's better to put it here before the loop for better optimisation)
    choices = ["1. \(Fighter.type): \n \(Fighter.description)","2. \(Magus.type): \n \(Magus.description)","3. \(Colossus.type): \n \(Colossus.description)","4. \(Dwarf.type): \n \(Dwarf.description)"]

    //For each player..
    for player in 1...Game.numberOfPlayer {
        //We add the user when he choose his name
        addPlayer(player: player)
        print("Alright! We shall now call you \(myGame.getPlayerName(ofPlayer: player)) ")
        for character in 1...Character.numberOfCharacters {
            //For each character, he choose the type
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
            //Then the name, and finally, we add it
            introduction = "Please enter the name of your \(type)"
            addCharacter(player: player, type: type)
        }
        //the team is set. quick summary...
        showSumarry(player: player)
        print()
    }
}




//Func for a complete turn of the game
func play() {
    
    //By default, the user will use his weapon
    var useThisWeapon = true
    
    //First, we target the actual player
    myGame.nextPlayer()
    print("\n\n\(myGame.getPlayerName(ofPlayer: myGame.currentPlayer)), it is your turn.\n\n")
    
    //If this is not the beggining of the game, we can show what was the last action performed and then put the variable on false
    if !(myGame.firstAction) {
        print("Summary of the last action:")
        print(myGame.resumeLastAction())
    }
    //This is not the first action anymore when we will have finished..
    myGame.firstAction = false

    //Displaying the carracteristics of characters
    displayCarracteristics()
    
    //We makes sure than choices is empty, then we put all characters of users on choices, and wait to see wich character the user is going to choose..
    introduction = "Choose your character:"
    choices.removeAll()
    for character in 1...Character.numberOfCharacters {
        choices.append("\(character). " + myGame.getCharacterName(ofPlayer: myGame.currentPlayer, ofCharacter: character))
    }
    let attacker = askUserToChooseCharacter(introduction: introduction, myChoices: choices, player: myGame.currentPlayer)
    
    //Based on a random choice, the magic chest may or may not appear. If it appear, we will give the user the choice to take the new weapon or not. If he takes it, he have the choice to use his new weapon directly or not
    if myGame.generateMagicChest() {
        myGame.generateRandomWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker)
        print("a magic chest appear! You are so lucky!\nContent: \(myGame.getRandomWeaponType(ofPlayer: myGame.currentPlayer))\n\(myGame.getRandomWeaponDescription(ofPlayer: myGame.currentPlayer))")
        introduction = "Do you want to take this weapon?"
        choices = ["1. Yes","2. No"]
        let choice = askUserInput(introduction: introduction, myChoices: choices)
        switch choice {
        case 1:
            //The user choose to take the new weapon. We replace his current weapon by the new one, and initialise useThisWeapon on the fact that he wants to use it now ( choice 1 ) or not ( choice 2)
            myGame.replaceWeaponByMagicChest(ofPlayer: myGame.currentPlayer, ofCharacter: attacker)
            print("Weapon Replaced!")
            displayCarracteristics()
            introduction = "Do you want to use your new weapon now?"
            choices = ["1. Yes","2. No"]
            useThisWeapon = ( askUserInput(introduction: introduction, myChoices: choices) == 1 )
        case 2:
            //The user choose to not take the new weapon. We continue likes the chest never appears
            print("Nothing done")
        default:
            //We shouldn't come here...If we do, we stop the game.
            stopError()
        }
        //We display new Carracteristics of players and characters after update
        displayCarracteristics()
    }
    
    //Based on the previous choice, either the user use his new weapon or not
    if useThisWeapon {
        //The message displayed changed if the weapon is a healer or not
    if myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker ) {
        introduction = "Choose the member to heal:"
    } else {
        introduction = "Choose your opponent:"
    }
    
    //We cross the players tab. If the player we see is not our current character AND the weapon if not a healer, then the opponent var will take the value of the other player. Else, we takes the value of our current player
    var opponentPlayer = 0
    choices.removeAll()
    for (index,_) in myGame.players.enumerated() {
        //The playerToAnalize is set on x+1 because the tab is based on index 0
        let playerToAnalize = index + 1
        if  ( ( playerToAnalize != myGame.currentPlayer ) && ( !myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker) ) ) || ( ( myGame.isAHealerWeapon(ofPlayer: myGame.currentPlayer, ofCharacter: attacker ) ) && ( playerToAnalize == myGame.currentPlayer ) ) {
            opponentPlayer = playerToAnalize
            //When we got our player, we can add his characters on the choices to make for the next action
            for character in 1...Character.numberOfCharacters {
                choices.append("\(character). " + myGame.getCharacterName(ofPlayer: playerToAnalize, ofCharacter: character))
            }
        }
    }
    
    //Now we can take the result as the opponentcharacter choose for the action
    let opponent = askUserToChooseCharacter(introduction: introduction, myChoices: choices, player: opponentPlayer)
    
    //The attack function response false if the action has failed by lack on Mana for a magic action
    if !myGame.attack(attackerPlayer: myGame.currentPlayer, attackerCharacter: attacker, opponentPlayer: opponentPlayer, opponentCharacter: opponent) {
        clearScreen()
        print("\(myGame.getPlayerName(ofPlayer: myGame.currentPlayer)), You don't have enought mana! The action has failed!\n\n\n\n")
    } else {
        clearScreen()
        }
    }
    
    //When we arrived at the last player ( 1 turned has pass), we can give points of mana to each character
    if myGame.currentPlayer == Game.numberOfPlayer {
        myGame.restoremana()
    }
}






//The game Start Here with the main menu
introduction = "\n\n\nWelcome to the Game Dead Penalties. Are you ready to start a new Game ?\n\n"
choices = ["1. Yeah let's fight! I'm ready!", "2. Begin a new game with random characters", "3. Well...I'm not sure...I Better leave here.." ]
userChoice = askUserInput(introduction:introduction , myChoices: choices)

switch userChoice {
case 1:
    //We start a normal game
    initGameNormal()
case 2:
    //We choose the type of characters for the user
    initGameWithRandomCharacter()
case 3:
    //We leave the game
    print("Goodbye!")
    exit(0)
default:
    //We should'nt come here...if we do, stop the game!
    stopError()
}


//The game begin. While we are not finished, we play!
while !myGame.checkIfGameIsFinished() {
play()
}

//This is over! Leaving whithout error. We can congratulate the winner and give the number of turn
print("The Game is finished! \(myGame.getPlayerName(ofPlayer: myGame.currentPlayer)) is the winner!\n\nYou played for \(myGame.nbOfTurn) turns.")
exit(0)
