//
//  Colossus.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Colossus: Character {
    
    static let startLifePoint = 800

    init(name: String) {
        super.init(name: name, life: Colossus.startLifePoint)
    }
    
}
