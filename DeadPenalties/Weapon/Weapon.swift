//
//  Weapon.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Weapon {
    
    static let numberOfWeapon = 3
    
    let givePoints: Bool
    let affectedPoints: Int
    var type: String
    
    init(type: String, givePoints: Bool, affectedPoints: Int) {
        self.type = type
        self.givePoints = givePoints
        self.affectedPoints = affectedPoints
    }
    
    func getDescription() -> String {
        return "description"
    }
    
}
