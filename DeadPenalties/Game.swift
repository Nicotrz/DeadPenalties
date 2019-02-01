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
    var currentPlayer = Int.random(in: 1...Game.numberOfPlayer)
    var lastAction = Action()
    var nbOfTurn = 0
    var firstAction = true
    
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
    
    func getCharacterStartingLifePoint(ofPlayer index_player: Int, ofCharacter index_character: Int) -> Int {
        return players[index_player - 1].getCharacterStartingLife(ofCharacter: index_character)
    }
 
    func isAHealerWeapon(ofPlayer index_player: Int, ofCharacter index_character: Int ) -> Bool {
        return players[index_player - 1].getWeaponType(ofCharacter: index_character)
    }
    
    func getLifeWeapon (ofPlayer index_player: Int, ofCharacter index_character: Int ) -> Int {
        return players[index_player - 1].getLifeWeapon(ofCharacter: index_character)
    }
    
    func getManaWeapon(ofplayer index_player: Int, ofCharacter index_character: Int) -> Int {
        return players[index_player - 1].getManaWeapon(ofCharacter: index_character)
    }
    
    func getWeaponDescription(ofPlayer index_player: Int, ofCharacter index_character: Int ) -> String {
        return players[index_player - 1].getWeaponDescription(ofCharacter: index_character)
    }
    
    func generateRandomTypeOfCharacter() -> String {
        let random = Int.random(in: 1...4)
        switch random {
        case 1:
            return Colossus.type
        case 2:
            return Magus.type
        case 3:
            return Dwarf.type
        case 4:
            return Fighter.type
        default:
            return Fighter.type
        }
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
    
    
    func attack(attackerPlayer: Int,attackerCharacter: Int, opponentPlayer: Int, opponentCharacter:Int ) -> Bool {
        let damage = getLifeWeapon(ofPlayer: attackerPlayer, ofCharacter: attackerCharacter)
        let impactedMana = getManaWeapon(ofplayer: attackerPlayer, ofCharacter: attackerCharacter)
        let healer = isAHealerWeapon(ofPlayer: attackerPlayer, ofCharacter: attackerCharacter)
        var lifepoint = getCharacterLife(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter)
        let weaponName = getCharacterWeaponName(ofPlayer: attackerPlayer, ofCharacter: attackerCharacter)
        let oneTimeWeapon = players[attackerPlayer - 1].getOneTimeWeapon(ofCharacter: attackerCharacter)
        let fullRecover: Bool
        let magicRock: Bool
        
        if players[attackerPlayer - 1].useMana(character: attackerCharacter, impactedPoint: impactedMana) {
        if ( damage >= lifepoint ) && ( !healer ) {
            players[opponentPlayer - 1].kill(character: opponentCharacter)
        } else {
            players[opponentPlayer - 1].attack(opponentCharacter: opponentCharacter, impactedPoint: damage, healer: healer, weapon: weaponName)
        }
        lifepoint = getCharacterLife(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter)
        fullRecover = (( lifepoint == players[opponentPlayer - 1].getCharacterStartingLife(ofCharacter: opponentCharacter) ) && ( healer ))
        magicRock = ( weaponName == MagicRock.type )
            saveCurrentState(player: attackerPlayer, character: attackerCharacter, opponentPlayer: opponentPlayer, opponentCharacter: opponentCharacter, fullRecover: fullRecover, magicRock: magicRock )
            if oneTimeWeapon {
                players[attackerPlayer - 1].lostWeapon(character: attackerCharacter)
            }
            return true
        } else {
            return false
        }
    }
    
    func restoremana() {
        for player in players {
            player.restoreMana()
        }
    }
    
    
    func checkIfGameIsFinished() -> Bool {
        var isFinished = true
        for player in 1...Game.numberOfPlayer {
            isFinished = true
            for character in 1...Character.numberOfCharacters {
                if !getCharacterDeadStatus(ofPlayer: player, ofCharacter: character) {
                    isFinished = false
                }
            }
            if isFinished {
                return isFinished
            }
        }
        return isFinished
    }
    
    func saveCurrentState(player: Int, character: Int, opponentPlayer: Int, opponentCharacter: Int, fullRecover: Bool, magicRock: Bool) {
        lastAction.replaceValue(player: getPlayerName(ofPlayer: player), character: getCharacterName(ofPlayer: player, ofCharacter: character), opponentPlayer: getPlayerName(ofPlayer: opponentPlayer), opponentCharacter: getCharacterName(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter), healer: isAHealerWeapon(ofPlayer: player, ofCharacter: character), haskill: getCharacterDeadStatus(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter), pointsAffected: getLifeWeapon(ofPlayer: player, ofCharacter: character), fullRecover: fullRecover, magicRock: magicRock)
    }
    
    func resumeLastAction() -> String {
    return lastAction.resumeLastAction()
    }
    
    func nextPlayer() {
        if currentPlayer == Game.numberOfPlayer {
            currentPlayer = 1
            nbOfTurn += 1
        } else {
            currentPlayer += 1
        }
    }
    
    //Func to generate the magic chest or not..
    func generateMagicChest() -> Bool {
        return Bool.random()
        }
    
    
    func generateRandomWeapon(ofPlayer index_player: Int, ofCharacter index_character: Int) {
        var autorizeToChangeWeapon = false
        while !autorizeToChangeWeapon {
            players[index_player - 1].generateRandomWeapon()
            if ( !(players[index_player - 1].getCharacterMagicalStatus(ofCharacter: index_character)) && (players[index_player - 1].getMagicChestMagicalStatus()) ) || ( getRandomWeaponType(ofPlayer: index_player) == getCharacterWeaponName(ofPlayer: index_player, ofCharacter: index_character) ) {
                players[index_player - 1].generateRandomWeapon()
            } else {
                autorizeToChangeWeapon = true
            }
        }
        
    }
    
    func getRandomWeaponType(ofPlayer index_player: Int) -> String {
        return players[index_player - 1].getMagicChestType()
    }
    
    func getRandomWeaponMagic(ofPlayer index_player: Int) -> Bool {
        return players[index_player - 1].getMagicChestMagicalStatus()
    }
    
    func getRandomWeaponDescription(ofPlayer index_player: Int) -> String {
        return players[index_player - 1].getMagicChestDescription()
    }
    
    func isAllowedToHaveMagicalWeapon(ofPlayer index_player: Int, ofCharacter index_character: Int) -> Bool {
        return players[index_player - 1].getCharacterMagicalStatus(ofCharacter: index_character)
    }
    
    func replaceWeaponByMagicChest(ofPlayer index_player: Int, ofCharacter index_character: Int) {
        players[index_player - 1].replaceWeaponByMagicChest(ofCharacter: index_character)
    }

    func gainMagicalPower(ofPlayer index_player: Int, ofCharacter index_character: Int ) {
        print("player \(index_player) is ready to give magical power to the character \(index_character)")
        players[index_player - 1].gainMagicalPower(character: index_character)
    }
    
    func getMana(ofPlayer index_player: Int, ofCharacter index_character: Int ) -> Int {
        return players[index_player - 1].getMana(character: index_character)
    }
    
    func restoreFullMana(ofPlayer index_player: Int, ofCharacter index_character: Int ) {
        players[index_player - 1].restoreFullMana(character: index_character)
    }
    
}
