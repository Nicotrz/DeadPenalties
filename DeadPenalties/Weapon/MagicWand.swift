//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Magic Wand Child of the weapon class
class MagicWand: Weapon {
    //Caracteristics of the magic Wand
    static let type = "Magic Wand ✨"
    static let givePoints = true
    static let affectedPoints = 15
    static let affectedMana = 30
    static let magicalWeapon = true
    static let description = "This Weapon give back \(MagicWand.affectedPoints) points to a member of the team.\nIt cost \(MagicWand.affectedMana) points of mana"
    static let oneTimeWeapon = false
    
    //Initiate
    init() {
        super.init(type: MagicWand.type, givePoints: MagicWand.givePoints, affectedPoints: MagicWand.affectedPoints, magicalWeapon: MagicWand.magicalWeapon, affectedMana: MagicWand.affectedMana, oneTimeWeapon: MagicWand.oneTimeWeapon )
    }
    
    //Return description
    override func getDescription() -> String {
        return MagicWand.description
    }
    
}
