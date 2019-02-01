//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Fist: Weapon {
    static let type = "Fist 🤜"
    static let givePoints = false
    static let affectedPoints = 5
    static let affectedMana = 0
    static let magicalWeapon = false
    static let description = "This Weapon take \(Fist.affectedPoints) points from the opponent"
    static let oneTimeWeapon = false
    
    init() {
        super.init(type: Fist.type, givePoints: Fist.givePoints, affectedPoints: Fist.affectedPoints, magicalWeapon: Fist.magicalWeapon, affectedMana: Fist.affectedMana, oneTimeWeapon: Fist.oneTimeWeapon )
    }
    
    override func getDescription() -> String {
        return Fist.description
    }
}
