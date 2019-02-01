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
    
    var magicChest = Weapon(type: "", givePoints: true, affectedPoints: 0, magicalWeapon: false, affectedMana: 0, oneTimeWeapon: false)
    
    init(name:String) {
        self.name = name
    }
    
    func addCharacter(type: String, name: String) {
               if type == Fighter.type {
            charactersArray.append(Fighter(name: name))
        } else if type == Magus.type {
            charactersArray.append(Magus(name: name))
        } else if type == Colossus.type {
            charactersArray.append(Colossus(name: name))
        } else if type == Dwarf.type {
            charactersArray.append(Dwarf(name: name))
        }
    }
    
    func getCharacterName(ofCharacter index: Int) -> String {
        return charactersArray[index - 1].name
    }
    
    func getCharacterType(ofCharacter index: Int) -> String {
        return charactersArray[index - 1].type
    }
    
    func getCharacterLife(ofCharacter index: Int) -> Int {
        return charactersArray[index - 1].life
    }
    
    func getCharacterStartingLife(ofCharacter index: Int) -> Int {
        return charactersArray[index - 1].getStartingLifePoint()
    }
    
    func getCharacterDeadStatus(ofCharacter index: Int) -> Bool {
        return charactersArray[index - 1].isDead
    }
    
    func getCharacterWeaponName(ofCharacter index: Int) -> String {
        return charactersArray[index - 1].getWeaponName()
    }
    
    func getCharacterMagicalStatus(ofCharacter index: Int) -> Bool {
        return charactersArray[index - 1].hasMagicalPower
    }
    
    func getWeaponType(ofCharacter index: Int) -> Bool {
        return charactersArray[index - 1].getTypeWeapon()
    }

    func getLifeWeapon(ofCharacter index: Int) -> Int {
        return charactersArray[index - 1].getLifeWeapon()
    }
    
    func getManaWeapon(ofCharacter index: Int) -> Int {
        return charactersArray[index - 1].getManaWeapon()
    }
    
    func getWeaponDescription(ofCharacter index: Int) -> String {
        return charactersArray[index - 1].getWeaponDescription()
    }
    
    func getOneTimeWeapon(ofCharacter index: Int) -> Bool {
        return charactersArray[index - 1].getOneTimeWeapon()
    }
    
    func getCharacterStartingLifePoint(ofCharacter index: Int) -> Int {
        return charactersArray[index - 1].getStartingLifePoint()
    }
    
    func generateRandomWeapon() {
        let randomWeapon = Int.random(in: 1...Weapon.numberOfWeapon)
        switch randomWeapon {
        case 1:
            magicChest = Sword()
        case 2:
            magicChest = MagicWand()
        case 3:
            magicChest = Axe()
        case 4:
            magicChest = MagicBook()
        case 5:
            magicChest = MagicRock()
        case 6:
            magicChest = BookOfDead()
        case 7:
            magicChest = MagicPotion()
        default:
            magicChest = Sword()
        }
    }
    
    func getMagicChestType() -> String {
        return magicChest.type
    }
    
    func getMagicChestMagicalStatus() -> Bool {
        return magicChest.magicalWeapon
    }
    
    func getMagicChestDescription() -> String {
        return magicChest.getDescription()
    }
    
    func replaceWeaponByMagicChest(ofCharacter index: Int) {
        charactersArray[index - 1].changeCharacterWeapon(weapon: magicChest)
    }
    
    func checkIfNameAlreadyExist(name:String ) -> Bool {
        for character in charactersArray {
            if character.name.lowercased() == name.lowercased() {
                return true
            }
        }
        return false
    }
    
    func attack(opponentCharacter: Int, impactedPoint:Int, healer:Bool, weapon:String ) {
        charactersArray[opponentCharacter - 1].attack(impactedPoint: impactedPoint, healer: healer, weapon: weapon)
    }
    
    func kill(character:Int) {
        charactersArray[character - 1].kill()
    }
    
    func gainMagicalPower(character: Int) {
        charactersArray[character - 1].gainMagicalPower()
    }
    
    func lostWeapon(character: Int) {
        charactersArray[character - 1].lostWeapon()
    }
    
    func getMana(character: Int) -> Int {
        return charactersArray[character - 1].mana
    }
    
    func restoreFullMana(character: Int) {
        charactersArray[character - 1].restoreFullMana()
    }
    
    func restoreMana() {
        for character in charactersArray {
            character.restoreMana()
        }
    }
    
    func getWeaponMagicalStatus(character: Int) -> Bool {
        return charactersArray[character - 1].getWeaponMagicalStatus()
    }
    
    func useMana(character: Int, impactedPoint: Int) -> Bool {
        return charactersArray[character - 1].useMana(impactedPoint:impactedPoint)
    }
}
