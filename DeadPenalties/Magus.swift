//
//  Magus.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Magus: Character {
    
    static let startLifePoint = 300
    static let startWeapon = "Magic Wand"
    static let description = "The healer of the team.\n Starting Life Point: \(Magus.startLifePoint)\n Starting Weapon: \(Magus.startWeapon)\n"

    init(name: String) {
        super.init(name: name, life: Magus.startLifePoint,weapon: Weapon(name: Magus.startWeapon),type: "Magus")
    }
    
}
