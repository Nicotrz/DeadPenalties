//
//  BookOfDead.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 01/02/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//BookOfDead child of the weapon object
class BookOfDead: Weapon {
    static let type = "Book of the dead  ☠️"
    static let givePoints = false
    //Number of point high to kill any character pointed by this weapon
    static let affectedPoints = 9999999
    static let affectedMana = 90
    static let magicalWeapon = true
    static let description = "The formula in this book kill any member of the opposite team.\nIt cost \(BookOfDead.affectedMana) points of mana and can only be used once "
    static let oneTimeWeapon = true
    
    //Initiate the object
    init() {
        super.init(type: BookOfDead.type, givePoints: BookOfDead.givePoints, affectedPoints: BookOfDead.affectedPoints, magicalWeapon: BookOfDead.magicalWeapon, affectedMana: BookOfDead.affectedMana, oneTimeWeapon: BookOfDead.oneTimeWeapon )
    }
    
    //Return description
    override func getDescription() -> String {
        return BookOfDead.description
    }
    
}

