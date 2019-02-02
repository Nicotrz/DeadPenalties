//
//  Magus.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Magus child of the Character object
class Magus: Character {
    
    static let startLifePoint = 75
    static let startWeapon = MagicWand.type
    static let type = "Magus 🧙🏻‍♂️"
    static let hasMagicalPower = true
    static let description = "The healer of the team.\n Starting Life Point: \(Magus.startLifePoint)\n Starting Weapon: \(Magus.startWeapon)\n"

    //Initiate
    init(name: String) {
        super.init(name: name, life: Magus.startLifePoint,weapon: MagicWand(),type: Magus.type, hasMagicalPower: Magus.hasMagicalPower )
    }
    
    //Get starting life point
    override func getStartingLifePoint() -> Int {
        return Magus.startLifePoint
    }
}
