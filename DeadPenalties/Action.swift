//
//  Action.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 30/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//


//An action object is a complete overview of a player turn. It is used to record the last action of the player for an overview from the next player
class Action {
    
    //Name of the player who performed the action and his character
    var player: String
    var character: String
    //The opponent player and his character
    var opponentPlayer: String
    var opponentCharacter: String
    
    //Was that a healer? ( action on our own team?)
    var healer: Bool
    //Was the user killed by this action?
    var hasKill: Bool
    //If it was not kill, how many points where affected?
    var pointsAffected: Int
    //was the character fully recover?
    var fullLifeRecover: Bool
    //Did we use the magic rock weapon ( specific action. It won't affect points)
    var magicRock: Bool
    
    //We can initiate everything with empty / false values
    init() {
        self.player = ""
        self.character = ""
        self.opponentPlayer = ""
        self.opponentCharacter = ""
        self.healer = false
        self.hasKill = false
        self.pointsAffected = 0
        self.fullLifeRecover = false
        self.magicRock = false
    }
    
    //This is for recording a turn with good values
    func replaceValue(player: String, character: String, opponentPlayer: String, opponentCharacter: String, healer: Bool, haskill: Bool, pointsAffected: Int, fullRecover: Bool, magicRock: Bool) {
        self.player = player
        self.character = character
        self.opponentPlayer = opponentPlayer
        self.opponentCharacter = opponentCharacter
        self.healer = healer
        self.hasKill = haskill
        self.pointsAffected = pointsAffected
        self.fullLifeRecover = fullRecover
        self.magicRock = magicRock
    }
    
    //This is for returning a string with a summary of the action performed
    func resumeLastAction() -> String {
        if magicRock {
            return "\(player) used \(MagicRock.type) on \(opponentCharacter)."
        }
        if fullLifeRecover {
            return "\(player) gave back full life to \(opponentCharacter)"
        }
        if healer {
            return "\(player) has heal \(opponentCharacter). It gave it back \(pointsAffected) points!"
        }
        if hasKill {
            return "\(player) has kill \(opponentCharacter) from \(opponentPlayer) with \(character)!"
        }
        return "\(player) attacked \(opponentCharacter) from \(opponentPlayer) with \(character). He took him \(pointsAffected) points!"
    }
}
