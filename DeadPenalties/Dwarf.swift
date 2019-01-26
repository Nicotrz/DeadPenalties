//
//  Dwarf.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Dwarf: Character {
    
    static let startLifePoint = 50
    static let startWeapon = "Axe"
    static let description = "You have his loyalty. But be carreful, his size is his weakness!\n Starting Life Point: \(Dwarf.startLifePoint)\n Starting Weapon: \(Dwarf.startWeapon)\n"


    init(name: String) {
        super.init(name: name, life: Dwarf.startLifePoint,weapon: Weapon(name: Dwarf.startWeapon),type: "Dwarf")
    }
}
