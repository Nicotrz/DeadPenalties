//
//  Team.swift
//  DeadPenalties
//
//  Created by Nicolas Sommereijns on 24/01/2019.
//  Copyright © 2019 Nicolas Sommereijns. All rights reserved.
//

//A team object is the team of each player. It contain an array with the 3 characters and the player name
class Team {
    var charactersArray = [Character]()
    let name: String
    
    //Each user have as well a MagicChest of type weapon ( not available automatically and initiate with dummy values at first)
    var magicChest = Weapon(type: "", givePoints: true, affectedPoints: 0, magicalWeapon: false, affectedMana: 0, oneTimeWeapon: false)
    
    //Initialisation just with the name
    init(name:String) {
        self.name = name
    }
    
    //Function to add character depending on the type sended
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
    
    //Function to get the Character caracteristics
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
    
    func getCharacterStartingLifePoint(ofCharacter index: Int) -> Int {
        return charactersArray[index - 1].getStartingLifePoint()
    }
    
    func getMana(character: Int) -> Int {
        return charactersArray[character - 1].mana
    }
    
    //Function to get the character weapon characteristics
    
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
    
    func getWeaponMagicalStatus(character: Int) -> Bool {
        return charactersArray[character - 1].getWeaponMagicalStatus()
    }
 
    //Functions to get the Magic Chest caracteristics
    
    func getMagicChestType() -> String {
        return magicChest.type
    }
    
    func getMagicChestMagicalStatus() -> Bool {
        return magicChest.magicalWeapon
    }
    
    func getMagicChestDescription() -> String {
        return magicChest.getDescription()
    }
    
    
    //This is for initiate a magic chest => Completly random weapon from all the weapon availables
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
 
    //If the user choose to take the magic chest, we replace the current weapon by the new one.
    func replaceWeaponByMagicChest(ofCharacter index: Int) {
        charactersArray[index - 1].changeCharacterWeapon(weapon: magicChest)
    }
    
    
    //Basic function to check if the character name already exist on the CharracterArray Array. ( forced lower case for better checking)
    func checkIfNameAlreadyExist(name:String ) -> Bool {
        for character in charactersArray {
            if character.name.lowercased() == name.lowercased() {
                return true
            }
        }
        return false
    }
    
    // Function on action performed on the character
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
    
    func restoreFullMana(character: Int) {
        charactersArray[character - 1].restoreFullMana()
    }
    
    //Function on action performed by the character
    func useMana(character: Int, impactedPoint: Int) -> Bool {
        return charactersArray[character - 1].useMana(impactedPoint:impactedPoint)
    }
    
    //This function give back points of mana on each character ( 1 time by turn)
    func restoreMana() {
        for character in charactersArray {
            character.restoreMana()
        }
    }
    
 
    
 
}
