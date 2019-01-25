//
//  Magus.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Magus: Character {
    
    static let startLifePoint = 300

    init(name: String) {
        super.init(name: name, life: Magus.startLifePoint)
    }
    
}
