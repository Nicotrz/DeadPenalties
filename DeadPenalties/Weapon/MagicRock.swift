//
//  MagicRock.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 31/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Magick Rock child of the weapon object
//Little bit of a special weapon. It does not affect anything except mana and possibility to have magical power
class MagicRock: Weapon {
    static let type = "Magic Rock 💎"
    static let givePoints = true
    static let affectedPoints = 0
    static let affectedMana = 0
    static let magicalWeapon = false
    static let description = "This rock give at your characters the ability to use magical weapon! It can only be used once. If the character already have magic power, it restore his mana at full capacity"
    static let oneTimeWeapon = true
    
    //Initiate
    init() {
        super.init(type: MagicRock.type, givePoints: MagicRock.givePoints, affectedPoints: MagicRock.affectedPoints, magicalWeapon: MagicRock.magicalWeapon, affectedMana: MagicRock.affectedMana, oneTimeWeapon: MagicRock.oneTimeWeapon )
    }
    
    //Return description
    override func getDescription() -> String {
        return MagicRock.description
    }
    
}

