//
//  Action.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 30/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

class Action {
    
    var player: String
    var character: String
    var opponentPlayer: String
    var opponentCharacter: String
    var healer: Bool
    var hasKill: Bool
    var pointsAffected: Int
    var fullLifeRecover: Bool
    var magicRock: Bool
    
    
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
