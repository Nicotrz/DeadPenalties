//
//  MagicBook.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 31/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//Magic Book child of weapon
class MagicBook: Weapon {
    //Caracteristics of the magic book
    static let type = "Magic Book 📕 "
    static let givePoints = true
    //Give back 9999999 points. The value here is just set to recover full life on any state
    static let affectedPoints = 9999999
    static let affectedMana = 80
    static let magicalWeapon = true
    static let description = "The formula in this book regenerate the full life of any member of your team.\nIt cost \(MagicBook.affectedMana) points of mana and can only be used once."
    static let oneTimeWeapon = true
    
    //Initiate the object
    init() {
        super.init(type: MagicBook.type, givePoints: MagicBook.givePoints, affectedPoints: MagicBook.affectedPoints, magicalWeapon: MagicBook.magicalWeapon, affectedMana: MagicBook.affectedMana, oneTimeWeapon: MagicBook.oneTimeWeapon )
    }
    
    //Return description
    override func getDescription() -> String {
        return MagicBook.description
    }
    
}
