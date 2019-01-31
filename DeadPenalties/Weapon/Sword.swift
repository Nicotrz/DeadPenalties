//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Sword: Weapon {
    static let type = "Sword ⚔️"
    static let givePoints = false
    static let affectedPoints = 10
    static let description = "This Weapon take \(Sword.affectedPoints) points from the opponent"
    
    init() {
        super.init(type: Sword.type, givePoints: Sword.givePoints, affectedPoints: Sword.affectedPoints)
    }
    
    override func getDescription() -> String {
        return Sword.description
    }
    
}
