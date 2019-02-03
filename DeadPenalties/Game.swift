//
//  Game.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//This is the main object of the game. it contain every usefull function and information
class Game {
    
    //The game is not planned for more than 2 player. Changing this value will makes bug.
    static let numberOfPlayer = 2
    
    //Array of Players
    var players = [Team]()
    
    //The game begin with one of the 2 players randomly
    var currentPlayer = Int.random(in: 1...Game.numberOfPlayer)
    
    //Recording last action
    var lastAction = Action()
    
    //Value for statistics purpose only ( at the end of the game)
    var nbOfTurn = 0
    
    //When we begin, this is the last action. For not showing the last performed action on the first action of the game.
    var firstAction = true
    
    //Function to add a player to the game
    func addPlayer(name: String) {
        players.append(Team(name: name))
    }
    
    //Functions to get the player caracteristics
    func getPlayerName(ofPlayer index: Int) -> String {
        return players[index-1].name
    }
    
    //Function to add a character to the player
    func addCharacter(ofPlayer index: Int, type: String, name:String) {
        players[index-1].addCharacter(type: type, name: name)
    }
    
    //Functions to get the character caracteristics
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
    
    //Functions to get the weapon caracteristics
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
    
    //Function to generate a type of character from the one availables
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
    
    //Cheking on each player if the name of the caracter does not exist yet.
    func checkIfCharacterAlreadyExist(name:String) -> Bool {
        for player in players {
            if player.checkIfNameAlreadyExist(name: name) {
            return true
            }
        }
        return false
    }
    
    //Checking on each player if the name of the player does not exist yet ( lower level. The check occured here)
    func checkIfPlayerAlreadyExist(name:String) -> Bool {
        for player in players {
            if player.name.lowercased() == name.lowercased() {
                return true
            }
        }
        return false
    }
    
    
    //This function perform each attack
    func attack(attackerPlayer: Int,attackerCharacter: Int, opponentPlayer: Int, opponentCharacter:Int ) -> Bool {
        //Number of point impacted by the attack ( can be 0 if the weapon does something else)
        let damage = getLifeWeapon(ofPlayer: attackerPlayer, ofCharacter: attackerCharacter)
        //Number of Mana points impacted by the attack ( can be 0 if not magical weapon)
        let impactedMana = getManaWeapon(ofplayer: attackerPlayer, ofCharacter: attackerCharacter)
        //Was that a positive action? ( healer or not?)
        let healer = isAHealerWeapon(ofPlayer: attackerPlayer, ofCharacter: attackerCharacter)
        //The life points before the attack
        var lifepoint = getCharacterLife(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter)
        //The name of the weapon
        let weaponName = getCharacterWeaponName(ofPlayer: attackerPlayer, ofCharacter: attackerCharacter)
        // If the weapon can be used only once, we will lose it after the action
        let oneTimeWeapon = players[attackerPlayer - 1].getOneTimeWeapon(ofCharacter: attackerCharacter)
        
        //We will give value to these on this function
        let fullRecover: Bool
        let magicRock: Bool
        
        //We need to check first if the user have enought mana. Otherwise, we won't be able to perform the action
        if players[attackerPlayer - 1].useMana(character: attackerCharacter, impactedPoint: impactedMana) {
            //He have enought mana. Then, if this is not a healer, and the damage is bigger than the lifepoints, it kill the opponent character. Else it attack it ( attack and kill function on the Team Object)
        if ( damage >= lifepoint ) && ( !healer ) {
            players[opponentPlayer - 1].kill(character: opponentCharacter)
        } else {
            players[opponentPlayer - 1].attack(opponentCharacter: opponentCharacter, impactedPoint: damage, healer: healer, weapon: weaponName)
        }
        //We now refresh the lifepoints after the attack
        lifepoint = getCharacterLife(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter)
        //If we are back at the Starting life point and the attacker was a healer, then the character fully recover
        fullRecover = (( lifepoint == players[opponentPlayer - 1].getCharacterStartingLife(ofCharacter: opponentCharacter) ) && ( healer ))
        //Quick check to see if the weapon was a magic rock ( for recording the action)
        magicRock = ( weaponName == MagicRock.type )
        //Finally, we can record the action with the saveCurrentState function
        saveCurrentState(player: attackerPlayer, character: attackerCharacter, opponentPlayer: opponentPlayer, opponentCharacter: opponentCharacter, fullRecover: fullRecover, magicRock: magicRock )
            //If the weapon was intended to be used only one, the attacker will lost it after the action
            if oneTimeWeapon {
                players[attackerPlayer - 1].lostWeapon(character: attackerCharacter)
            }
            //The attack was successfull. Sending back true
            return true
        } else {
            //The attacked failed by lack of Mana. Sending back false, nothing was done.
            return false
        }
    }
    
    //This function restore a number of Mana points on each turn
    func restoremana() {
        for player in players {
            player.restoreMana()
        }
    }
    
    //Function to check if the game is not over
    func checkIfGameIsFinished() -> Bool {
        //It is over until prooved otherwise
        var isFinished = true
        //For each player..
        for player in 1...Game.numberOfPlayer {
            //Over until proved otherwise ( we need to check for each player)
            isFinished = true
            //For each character
            for character in 1...Character.numberOfCharacters {
                if !getCharacterDeadStatus(ofPlayer: player, ofCharacter: character) {
                    //If one of the character is alive, than the game is not over
                    isFinished = false
                }
            }
            //When we finished to see every character of the player, if they are all dead ( isFinished still equal true), then the game is over. We can send back the result
            if isFinished {
                return isFinished
            }
        }
        //If we arrived here, the game if probably not over. Sending back the result
        return isFinished
    }
    
    //Function to save the current state of the game to the lastAction value
    func saveCurrentState(player: Int, character: Int, opponentPlayer: Int, opponentCharacter: Int, fullRecover: Bool, magicRock: Bool) {
        lastAction.replaceValue(player: getPlayerName(ofPlayer: player), character: getCharacterName(ofPlayer: player, ofCharacter: character), opponentPlayer: getPlayerName(ofPlayer: opponentPlayer), opponentCharacter: getCharacterName(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter), healer: isAHealerWeapon(ofPlayer: player, ofCharacter: character), haskill: getCharacterDeadStatus(ofPlayer: opponentPlayer, ofCharacter: opponentCharacter), pointsAffected: getLifeWeapon(ofPlayer: player, ofCharacter: character), fullRecover: fullRecover, magicRock: magicRock)
    }
    
    //Function to send back the last action
    func resumeLastAction() -> String {
    return lastAction.resumeLastAction()
    }
    
    //Function to pass to the next player ( = player + 1 or 1 if it is the end of the array). If it was the last player, we can also increment the nbOfTurn value
    func nextPlayer() {
        if currentPlayer == Game.numberOfPlayer {
            currentPlayer = 1
            nbOfTurn += 1
        } else {
            currentPlayer += 1
        }
    }
    
    //Func to generate the magic chest or not. It has 30% chances of appear
    func generateMagicChest() -> Bool {
        let willgenerate = Int.random(in: 0...100)
        return ( willgenerate <= 30 )
        }
    
    //Function to generate the random weapon founded on the magic chest
    func generateRandomWeapon(ofPlayer index_player: Int, ofCharacter index_character: Int) {
        //The user can not choose this weapon until prooved otherwise
        var autorizeToChangeWeapon = false
        //We generate a random weapon
        players[index_player - 1].generateRandomWeapon()
        while !autorizeToChangeWeapon {
            //if the weapon found has magical power but the character does not OR the weapon founded is the same type as the one we already owned, we generate a new one.
            if ( !(players[index_player - 1].getCharacterMagicalStatus(ofCharacter: index_character)) && (players[index_player - 1].getMagicChestMagicalStatus()) ) || ( getRandomWeaponType(ofPlayer: index_player) == getCharacterWeaponName(ofPlayer: index_player, ofCharacter: index_character) ) {
                players[index_player - 1].generateRandomWeapon()
            } else {
                //We can take the new one, everything is good
                autorizeToChangeWeapon = true
            }
        }
        
    }
    
    //Function to get the characteristics of the magic chest
    func getRandomWeaponType(ofPlayer index_player: Int) -> String {
        return players[index_player - 1].getMagicChestType()
    }
    
    func getRandomWeaponMagic(ofPlayer index_player: Int) -> Bool {
        return players[index_player - 1].getMagicChestMagicalStatus()
    }
    
    func getRandomWeaponDescription(ofPlayer index_player: Int) -> String {
        return players[index_player - 1].getMagicChestDescription()
    }
    
    //Function to have the characteristics of a character
    
    func isAllowedToHaveMagicalWeapon(ofPlayer index_player: Int, ofCharacter index_character: Int) -> Bool {
        return players[index_player - 1].getCharacterMagicalStatus(ofCharacter: index_character)
    }
    
    func getMana(ofPlayer index_player: Int, ofCharacter index_character: Int ) -> Int {
        return players[index_player - 1].getMana(character: index_character)
    }
    
    //Function to take the weapon of the magic chest
    func replaceWeaponByMagicChest(ofPlayer index_player: Int, ofCharacter index_character: Int) {
        players[index_player - 1].replaceWeaponByMagicChest(ofCharacter: index_character)
    }
    
    //Function to give a character magical power
    func gainMagicalPower(ofPlayer index_player: Int, ofCharacter index_character: Int ) {
        players[index_player - 1].gainMagicalPower(character: index_character)
    }
    
    
    //Function to give back all mana to a character
    func restoreFullMana(ofPlayer index_player: Int, ofCharacter index_character: Int ) {
        players[index_player - 1].restoreFullMana(character: index_character)
    }
    
}
