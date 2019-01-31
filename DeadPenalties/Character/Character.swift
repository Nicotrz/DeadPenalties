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
    var hasMagicalPower: Bool
    
    init(name: String, life: Int, weapon: Weapon, type: String, hasMagicalPower: Bool) {
        self.name=name
        self.life = life
        self.weapon = weapon
        self.type = type
        self.isDead = false
        self.hasMagicalPower = hasMagicalPower
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
    
    func randomWeapon() -> Weapon {
        let weapon: Weapon
        let randomWeapon = Int.random(in: 1...Weapon.numberOfWeapon)
        switch randomWeapon {
        case 1:
            weapon = Sword()
        case 2:
            weapon = MagicWand()
        case 3:
            weapon = Axe()
        default:
            weapon = Sword()
        }
        return weapon
    }
    
    func changeCharacterWeapon(weapon: Weapon) {
        self.weapon = weapon
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
    
    func gainMagicalPower() {
        hasMagicalPower = true
    }
    
}
