//
//  Game.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Game {
    
    static let numberOfPlayer = 2
    
    var players = [Team]()
    var currentPlayer = 1
    
    func addPlayer(name: String) {
        players.append(Team(name: name))
    }
    
    func getPlayerName(ofPlayer index: Int) -> String {
        return players[index-1].name
    }
    
    func addCharacter(ofPlayer index: Int, type: String, name:String) {
        players[index-1].addCharacter(type: type, name: name)
    }
    
    func getCharacterName(ofPlayer index_player: Int,ofCharacter index_character:Int ) -> String {
        return players[index_player - 1].getCharacterName(ofCharacter: index_character)
    }
    
    func getCharacterType(ofPlayer index_player: Int,ofCharacter index_character:Int) -> String {
        return players[index_player - 1].getCharacterType(ofCharacter: index_character)
    }
    
    func getCharacterDeadStatus(ofPlayer index_player: Int, ofCharacter index_character: Int) -> Bool {
        return players[index_player - 1].getCharacterDeadStatus(ofCharacter: index_character)
    }
    
    func getCharacterLife(ofPlayer index_player: Int, ofCharacter index_character: Int) -> Int {
        return players[index_player - 1].getCharacterLife(ofCharacter: index_character)
    }
    
    func getCharacterWeaponName(ofPlayer index_player: Int, ofCharacter index_character: Int) -> String {
        return players[index_player - 1].getCharacterWeaponName(ofCharacter: index_character)
    }
 
    func isAHealerWeapon(ofPlayer index_player: Int, ofCharacter index_character: Int ) -> Bool {
        return players[index_player - 1].getWeaponType(ofCharacter: index_character)
    }
    
    func getLifeWeapon (ofPlayer index_player: Int, ofCharacter index_character: Int ) -> Int {
        return players[index_player - 1].getLifeWeapon(ofCharacter: index_character)
    }
    
    func getWeaponDescription(ofPlayer index_player: Int, ofCharacter index_character: Int ) -> String {
        return players[index_player - 1].getWeaponDescription(ofCharacter: index_character)
    }
    
    func checkIfCharacterAlreadyExist(name:String) -> Bool {
        for player in players {
            if player.checkIfNameAlreadyExist(name: name) {
            return true
            }
        }
        return false
    }
    
    func checkIfPlayerAlreadyExist(name:String) -> Bool {
        for player in players {
            if player.name.lowercased() == name.lowercased() {
                return true
            }
        }
        return false
    }
}
