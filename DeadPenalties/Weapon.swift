//
//  Weapon.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Weapon {
    
    let name: String
    let givePoints: Bool
    let affectedPoints: Int
    
    init(name: String) {
        self.name = name
        if name == "Sword" {
            givePoints = false
            affectedPoints = 10
        } else if name == "Magic Wand" {
            givePoints = true
            affectedPoints = 15
        } else if name == "Fist" {
            givePoints = false
            affectedPoints = 5
        } else if name == "Axe" {
            givePoints = false
            affectedPoints = 30
        } else {
            givePoints = false
            affectedPoints = 0
        }
    }
    
}
