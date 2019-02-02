//
//  Character.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Contain all caracteristics of a character
class Character {
    
    //This value can be changed for changing the number of characters on the game ( 3 is the default)
    static let numberOfCharacters = 3
    
    //Name of the character
    let name: String
    //Life points available
    var life: Int
    //His weapon
    var weapon: Weapon
    //Type of character
    let type: String
    //Is he dead?
    var isDead: Bool
    //Does he have magical power?
    var hasMagicalPower: Bool
    //Mana is 100 by default for everyone ( not used if no magical power)
    var mana = 100

    //Initiate a new character
    init(name: String, life: Int, weapon: Weapon, type: String, hasMagicalPower: Bool ) {
        self.name=name
        self.life = life
        self.weapon = weapon
        self.type = type
        self.isDead = false
        self.hasMagicalPower = hasMagicalPower
    }
    
    //Function set to be overwrite by children. Return 0 ( dummy )
    func getStartingLifePoint() -> Int {
        return 0
    }
    
    //Get the weapon caracteristics
    func getWeaponName() -> String {
        return weapon.type
    }
    
    func getTypeWeapon() -> Bool {
        return weapon.givePoints
    }
    
    func getLifeWeapon() -> Int {
        return weapon.affectedPoints
    }
    
    func getManaWeapon() -> Int {
        return weapon.affectedMana
    }
    
    func getWeaponDescription() -> String {
        return weapon.getDescription()
    }
    
    func getWeaponMagicalStatus() -> Bool {
        return weapon.magicalWeapon
    }
    
    func getOneTimeWeapon() -> Bool {
        return weapon.oneTimeWeapon
    }

    //Restore the mana of 10 points at each turn. Max set is 100
    func restoreMana() {
        mana += 10
        if mana > 100 {
            mana = 100
        }
    }
    
    //Restore the Full mana ( Magic Rock effect)
    func restoreFullMana() {
        mana = 100
    }
    
    //Set a new sending weapon to the character
    func changeCharacterWeapon(weapon: Weapon) {
        self.weapon = weapon
    }
    
    //The character does not have any weapon anymore => Forcing a Fist
    func lostWeapon() {
        weapon = Fist()
    }
    
    //Kill the character
    func kill() {
        isDead = true
        life = 0
    }
    
    //Trying to use the given mana. If the action was a success ( enought mana), we send true. Else we send false
    func useMana(impactedPoint: Int) -> Bool {
        if impactedPoint <= mana {
        mana -= impactedPoint
            return true
        } else {
            return false
        }
    }
    
 
    //The character has been attacked
    func attack(impactedPoint: Int, healer:Bool, weapon: String ) {
        //Special case: if this is a magic rock, the user gain magical power and restore full mana
        if weapon == MagicRock.type {
            gainMagicalPower()
            restoreFullMana()
        } else {
        //If it is not, checking if the attacker was a healer. If it was, he gain points. if not, he lost points
        if healer {
            life += impactedPoint
            //If we are higher then the number of max points, we set the life to the starting point life
            if life > getStartingLifePoint() {
                life = getStartingLifePoint()
            }
        } else {
            //We loose point
            life -= impactedPoint
        }
        }
    }
    
    //Magic rock effect: the user gain magical power
    func gainMagicalPower() {
        hasMagicalPower = true
    }
    
}
