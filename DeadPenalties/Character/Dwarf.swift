//
//  Dwarf.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Dwarf: Character {
    
    static let startLifePoint = 30
    static let startWeapon = "Axe"
    static let description = "You have his loyalty. But be carreful, his size is his weakness!\n Starting Life Point: \(Dwarf.startLifePoint)\n Starting Weapon: \(Dwarf.startWeapon)\n"


    init(name: String) {
        super.init(name: name, life: Dwarf.startLifePoint,weapon: Axe(),type: "Dwarf")
    }
    
    override func getStartingLifePoint() -> Int {
        return Dwarf.startLifePoint
    }
}
