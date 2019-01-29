//
//  Character.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Character {
    
    static let numberOfCharacters = 3
    
    let name: String
    var life: Int
    var weapon: Weapon
    let type: String
    var isDead: Bool
    
    init(name: String, life: Int, weapon: Weapon, type: String) {
        self.name=name
        self.life = life
        self.weapon = weapon
        self.type = type
        self.isDead = false
    }
    
    func getWeaponName() -> String {
        return weapon.type
    }
    
    func getTypeWeapon() -> Bool {
        return weapon.givePoints
    }
    
    func getLifeWeapon() -> Int {
        return weapon.affectedPoints
    }
    
    func getWeaponDescription() -> String {
        return weapon.getDescription()
    }
    
    func getStartingLifePoint() -> Int {
        return 0
    }
    
    
    func kill() {
        isDead = true
        life = 0
    }
    
    func attack(impactedPoint: Int, healer:Bool ) {
        if healer {
            life += impactedPoint
            if life > getStartingLifePoint() {
                life = getStartingLifePoint()
            }
        } else {
            life -= impactedPoint
        }
    }
    
}
