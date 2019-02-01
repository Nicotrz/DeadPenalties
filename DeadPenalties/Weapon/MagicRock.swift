//
//  MagicRock.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 31/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class MagicRock: Weapon {
    static let type = "Magic Rock 💎"
    static let givePoints = true
    static let affectedPoints = 0
    static let affectedMana = 0
    static let magicalWeapon = false
    static let description = "This rock give at your characters the ability to use magical weapon! It can only be used once."
    static let oneTimeWeapon = true
    
    init() {
        super.init(type: MagicRock.type, givePoints: MagicRock.givePoints, affectedPoints: MagicRock.affectedPoints, magicalWeapon: MagicRock.magicalWeapon, affectedMana: MagicRock.affectedMana, oneTimeWeapon: MagicRock.oneTimeWeapon )
    }
    
    override func getDescription() -> String {
        return MagicRock.description
    }
    
}

