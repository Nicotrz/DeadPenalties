//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Sword child of the Weapon Object
class Sword: Weapon {
    //Caracteristics of the sword
    static let type = "Sword ⚔️"
    static let givePoints = false
    static let magicalWeapon = false
    static let affectedMana = 0
    static let affectedPoints = 10
    static let description = "This Weapon take \(Sword.affectedPoints) points from the opponent"
    static let oneTimeWeapon = false
    
    //Initiate the Sword
    init() {
        super.init(type: Sword.type, givePoints: Sword.givePoints, affectedPoints: Sword.affectedPoints, magicalWeapon: Sword.magicalWeapon, affectedMana: Sword.affectedMana, oneTimeWeapon: Sword.oneTimeWeapon )
    }
    
    //Return the description
    override func getDescription() -> String {
        return Sword.description
    }
    
}
