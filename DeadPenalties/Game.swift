//
//  Game.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Game {
    var players = [Team]()
    static let numberOfPlayer = 2
    init() {
        for i in 1...Game.numberOfPlayer {
            var result = "defaultvalue"
            while result == "defaultvalue" {
                print("Player \(i), please choose the name of your team:")
                if let teamName = readLine() {
                    if teamName != "" {
                    result = teamName
                    players.append(Team(name: result))
                    print("Alright. We shall now call you \(result)")
                    }
                }
            }
        }
}
    
}
