//
//  main.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

import Darwin

//This function ask the user to enter one of the numberOfChoice available. If the input is incorrect, he ask again until the choice is correct
func askUserInput(introduction: String, myChoices: [String]) -> Int {
    var result: Int = 99
    print(introduction + "\n\n")
    for i in myChoices {
        print(i)
    }
    while ( result > myChoices.count ) {
        if let choice = readLine() {
            if let int = Int(choice) {
                if int <= myChoices.count && int != 0 {
                    result = int
                    return result
                }
            }
        }
        print("Error! WRONG CHOICE!\n\nPlease enter one of the above option:")
    }
    return 999
}

let choices = ["1. Yeah let's fight! I'm ready!", "2. Well...I'm not sure...I Better leave here.."]
let userChoice = askUserInput(introduction: "Welcome to the Game Dead Penalties. Are you ready to start a new Game ?", myChoices: choices)

switch userChoice {
case 1:
    print("Starting the game then!")
case 2:
    print("Goodbye!")
    exit(0)
default:
    print("Error! Please try again")
    exit(2)
}
