//
//  Fighter.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 25/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Fighter: Character {
    
    static let startLifePoint = 100
    
       init(name: String) {
        super.init(name: name, life: Fighter.startLifePoint )
    }
    
    
}
