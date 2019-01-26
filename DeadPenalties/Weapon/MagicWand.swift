//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class MagicWand: Weapon {
    static let type = "Magic Wand"
    static let givePoints = true
    static let affectedPoints = 15
    
    init() {
        super.init(type: MagicWand.type, givePoints: MagicWand.givePoints, affectedPoints: MagicWand.affectedPoints)
    }
}
