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
    }
    
    func addCharacter(type: String, name: String) {
        if type == "Fighter" {
            charactersArray.append(Fighter(name: name))
        } else if type == "Magus" {
            charactersArray.append(Magus(name: name))
        } else if type == "Colossus" {
            charactersArray.append(Colossus(name: name))
        } else if type == "Dwarf" {
            charactersArray.append(Dwarf(name: name))
        }
    }
    
    func getCharacterName(ofCharacter index: Int) -> String {
        return charactersArray[index - 1].name
    }
    
    func getCharacterType(ofCharacter index: Int) -> String {
        return charactersArray[index - 1].type
    }
    
    func checkIfNameAlreadyExist(name:String ) -> Bool {
        for character in charactersArray {
            if character.name.lowercased() == name.lowercased() {
                return true
            }
        }
        return false
    }
    
}
