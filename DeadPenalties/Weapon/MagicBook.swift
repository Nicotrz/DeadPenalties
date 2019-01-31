//
//  MagicBook.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 31/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class MagicBook: Weapon {
    static let type = "Magic Book 📕 "
    static let givePoints = true
    static let affectedPoints = 9999999
    static let magicalWeapon = true
    static let description = "This book regenerate the full life of any member of your team"
    
    init() {
        super.init(type: MagicBook.type, givePoints: MagicBook.givePoints, affectedPoints: MagicBook.affectedPoints, magicalWeapon: MagicBook.magicalWeapon )
    }
    
    override func getDescription() -> String {
        return MagicBook.description
    }
    
}
