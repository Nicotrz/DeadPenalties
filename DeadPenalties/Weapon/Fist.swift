//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Fist: Weapon {
    static let type = "Fist"
    static let givePoints = false
    static let affectedPoints = 5
    
    init() {
        super.init(type: Fist.type, givePoints: Fist.givePoints, affectedPoints: Fist.affectedPoints)
    }
}