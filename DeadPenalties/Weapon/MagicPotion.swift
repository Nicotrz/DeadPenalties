//
//  MagicPotion.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 01/02/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Magic Potion child of the weapon object
class MagicPotion: Weapon {
    static let type = "Magic Potion 🧪"
    static let givePoints = true
    static let affectedPoints = 20
    static let affectedMana = 0
    static let magicalWeapon = false
    static let description = "This potion give back \(MagicPotion.affectedPoints) to any member of your team. It can only be used once."
    static let oneTimeWeapon = true
    
    //Initiate
    init() {
        super.init(type: MagicPotion.type, givePoints: MagicPotion.givePoints, affectedPoints: MagicPotion.affectedPoints, magicalWeapon: MagicPotion.magicalWeapon, affectedMana: MagicPotion.affectedMana, oneTimeWeapon: MagicPotion.oneTimeWeapon )
    }
    
    //Return description
    override func getDescription() -> String {
        return MagicPotion.description
    }
    
}
