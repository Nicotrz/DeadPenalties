//
//  Team.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Team {
    var charactersArray = [Character]()
    let name: String
    
    init(name:String) {
        self.name = name
        for i in 0...2 {
            charactersArray.append(Character(name:"Character \(i)"))
        }
    }
}
