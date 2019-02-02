//
//  Dwarf.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Dwarf child of the Character object
class Dwarf: Character {
    
    static let startLifePoint = 50
    static let startWeapon = Axe.type
    static let type = "Dwarf 👶"
    static let hasMagicalPower = false
    static let description = "You have his loyalty. But be carreful, his size is his weakness!\n Starting Life Point: \(Dwarf.startLifePoint)\n Starting Weapon: \(Dwarf.startWeapon)\n"


    //Initiate
    init(name: String) {
        super.init(name: name, life: Dwarf.startLifePoint,weapon: Axe(),type:Dwarf.type, hasMagicalPower: Dwarf.hasMagicalPower )
    }
    
    //Get starting life point
    override func getStartingLifePoint() -> Int {
        return Dwarf.startLifePoint
    }
}
