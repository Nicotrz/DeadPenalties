//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class MagicWand: Weapon {
    static let type = "Magic Wand ✨"
    static let givePoints = true
    static let affectedPoints = 15
    static let magicalWeapon = true
    static let description = "This Weapon give back \(MagicWand.affectedPoints) points to a member of the team"
    
    init() {
        super.init(type: MagicWand.type, givePoints: MagicWand.givePoints, affectedPoints: MagicWand.affectedPoints, magicalWeapon: MagicWand.magicalWeapon )
    }
    
    override func getDescription() -> String {
        return MagicWand.description
    }
    
}
