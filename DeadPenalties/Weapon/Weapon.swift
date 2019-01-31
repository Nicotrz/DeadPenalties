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
    let magicalWeapon: Bool
    
    init(type: String, givePoints: Bool, affectedPoints: Int, magicalWeapon: Bool) {
        self.type = type
        self.givePoints = givePoints
        self.affectedPoints = affectedPoints
        self.magicalWeapon = magicalWeapon
    }
    
    func getDescription() -> String {
        return "description"
    }
    
}
