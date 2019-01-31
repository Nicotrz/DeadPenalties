//
//  Fighter.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Fighter: Character {
    
    static let startLifePoint = 100
    static let startWeapon = Sword.type
    static let type = "Fighter 🧔"
    static let hasMagicalPower = false
    static let description = "Classic fighter. A good soldier.\n Starting Life Point: \(Fighter.startLifePoint)\n Starting Weapon: \(Fighter.startWeapon)\n"
    
       init(name: String) {
        super.init(name: name, life: Fighter.startLifePoint, weapon: Sword(), type: Fighter.type, hasMagicalPower: Fighter.hasMagicalPower )
    }
    
    override func getStartingLifePoint() -> Int {
        return Fighter.startLifePoint
    }
    
}
