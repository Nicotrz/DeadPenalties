//
//  Character.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Character {
    
    static let numberOfCharacters = 3
    
    let name: String
    var life: Int
    var weapon: Weapon
    let type: String
    
    init(name: String, life: Int, weapon: Weapon, type: String) {
        self.name=name
        self.life = life
        self.weapon = weapon
        self.type = type
    }
    
}
