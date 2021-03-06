//
//  Colossus.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Colossus child of the character array
class Colossus: Character {
    
    static let startLifePoint = 200
    static let startWeapon = Fist.type
    static let type = "Colossus 🧔"
    static let hasMagicalPower = false
    static let description = "A really resistant guy. But he won't hurt you a lot..\n Starting Life Point: \(Colossus.startLifePoint)\n Starting Weapon: \(Colossus.startWeapon)\n"

    //Initiate
    init(name: String) {
        super.init(name: name, life: Colossus.startLifePoint,weapon: Fist(),type: Colossus.type, hasMagicalPower: Colossus.hasMagicalPower )
    }
 
    //Get the starting life point
    override func getStartingLifePoint() -> Int {
        return Colossus.startLifePoint
    }
}
