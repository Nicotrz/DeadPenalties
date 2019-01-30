//
//  Sword.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 26/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Axe: Weapon {
    static let type = "Axe"
    static let givePoints = false
    static let affectedPoints = 40
    static let description = "This Weapon take \(Axe.affectedPoints) points from the opponent"
    
    init() {
        super.init(type: Axe.type, givePoints: Axe.givePoints, affectedPoints: Axe.affectedPoints)
    }
    
    override func getDescription() -> String {
        return Axe.description
    }
}
