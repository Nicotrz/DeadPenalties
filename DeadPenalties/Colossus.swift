//
//  Colossus.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Colossus: Character {
    
    static let startLifePoint = 800
    static let startWeapon = "Fist"
    static let description = "A really resistant guy. But he won't hurt you a lot..\n Starting Life Point: \(Colossus.startLifePoint)\nStarting Weapon: \(Colossus.startWeapon)"

    init(name: String) {
        super.init(name: name, life: Colossus.startLifePoint,weapon: Weapon(name: Colossus.startWeapon),type: "Colossus")
    }
    
}
