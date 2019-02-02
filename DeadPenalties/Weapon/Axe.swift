//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Axe child of weapon
class Axe: Weapon {
    //Caracteristics of the axe
    static let type = "Axe ⛏"
    static let givePoints = false
    static let affectedPoints = 40
    static let affectedMana = 0
    static let magicalWeapon = false
    static let description = "This Weapon take \(Axe.affectedPoints) points from the opponent"
    static let oneTimeWeapon = false
    
    //Initiate
    init() {
        super.init(type: Axe.type, givePoints: Axe.givePoints, affectedPoints: Axe.affectedPoints, magicalWeapon: Axe.magicalWeapon, affectedMana: Axe.affectedMana, oneTimeWeapon: Axe.oneTimeWeapon)
    }
    
    //Return description
    override func getDescription() -> String {
        return Axe.description
    }
}
