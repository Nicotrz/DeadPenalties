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
    
    
    init() {
        self.player = ""
        self.character = ""
        self.opponentPlayer = ""
        self.opponentCharacter = ""
        self.healer = false
        self.hasKill = false
        self.pointsAffected = 0
    }
    
    func replaceValue(player: String, character: String, opponentPlayer: String, opponentCharacter: String, healer: Bool, haskill: Bool, pointsAffected: Int) {
        self.player = player
        self.character = character
        self.opponentPlayer = opponentPlayer
        self.opponentCharacter = opponentCharacter
        self.healer = healer
        self.hasKill = haskill
        self.pointsAffected = pointsAffected
    }
    
    func resumeLastAction() -> String {
        if healer {
            return "\(player) has heal \(opponentCharacter). It gave it back \(pointsAffected) points!"
        }
        if hasKill {
            return "\(player) has kill \(opponentCharacter) from \(opponentPlayer) with \(character)!"
        }
        return "\(player) attacked \(opponentCharacter) from \(opponentPlayer) with \(character). He took him \(pointsAffected) points!"
    }
}
