//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Sword: Weapon {
    static let type = "Sword"
    static let givePoints = false
    static let affectedPoints = 10
    
    init() {
        super.init(type: Sword.type, givePoints: Sword.givePoints, affectedPoints: Sword.affectedPoints)
    }
}
