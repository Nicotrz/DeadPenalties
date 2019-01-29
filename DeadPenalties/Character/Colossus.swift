//
//  Colossus.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Colossus: Character {
    
    static let startLifePoint = 50
    static let startWeapon = "Fist"
    static let description = "A really resistant guy. But he won't hurt you a lot..\n Starting Life Point: \(Colossus.startLifePoint)\n Starting Weapon: \(Colossus.startWeapon)\n"

    init(name: String) {
        super.init(name: name, life: Colossus.startLifePoint,weapon: Fist(),type: "Colossus")
    }
 
    override func getStartingLifePoint() -> Int {
        return Colossus.startLifePoint
    }
}
