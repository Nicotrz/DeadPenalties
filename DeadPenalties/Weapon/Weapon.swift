//
//  Weapon.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//This Object is the mother class to any Weapon object
class Weapon {
    
    //Number of weapon currently available ( Fist is not included..Not really a weapon)
    static let numberOfWeapon = 7
    
    //Does the weapon give point?
    let givePoints: Bool
    //How many points are impacted?
    let affectedPoints: Int
    //What is the type ( name ) of the weapon?
    var type: String
    //Is this a magical weapon?
    let magicalWeapon: Bool
    //How many Mana points are impacted?
    let affectedMana: Int
    //Can the weapon be used more than once?
    let oneTimeWeapon: Bool
    
    //Initiate any weapon with given caracteristics
    init(type: String, givePoints: Bool, affectedPoints: Int, magicalWeapon: Bool, affectedMana: Int, oneTimeWeapon: Bool) {
        self.type = type
        self.givePoints = givePoints
        self.affectedPoints = affectedPoints
        self.magicalWeapon = magicalWeapon
        self.affectedMana = affectedMana
        self.oneTimeWeapon = oneTimeWeapon
    }
    
    //Return the description of the weapon. In this case it just return "description" ( dummy ). The function is intended to be overwrite for each child.
    func getDescription() -> String {
        return "description"
    }
    
}
