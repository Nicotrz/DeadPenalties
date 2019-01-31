//
//  Weapon.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Weapon {
    
    static let numberOfWeapon = 6
    
    let givePoints: Bool
    let affectedPoints: Int
    var type: String
    let magicalWeapon: Bool
    let affectedMana: Int
    
    init(type: String, givePoints: Bool, affectedPoints: Int, magicalWeapon: Bool, affectedMana: Int) {
        self.type = type
        self.givePoints = givePoints
        self.affectedPoints = affectedPoints
        self.magicalWeapon = magicalWeapon
        self.affectedMana = affectedMana
    }
    
    func getDescription() -> String {
        return "description"
    }
    
}
