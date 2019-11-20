# Dead Penalties
> A simple Command line game for the project number 3 of the iOS Developer training program of OpenclassRooms

<a href="https://github.com/Nicotrz"><img src="https://github.com/Nicotrz/DeadPenalties/blob/master/Capture%20d’écran%202019-11-20%20à%2020.19.51.png?raw=true" title="Dead Penalties" alt="Nicotrz"></a>
<!-- [![FVCproductions](https://github.com/Nicotrz/DeadPenalties/blob/master/Capture%20d’écran%202019-11-20%20à%2020.23.58.png?raw=true)](https://github.com/Nicotrz) -->

## Setup

Just clone this repo, archive it with Xcode and you're good to go!

## Features

- 2 supported players
- 3 supported characters by players
- 8 differents types of usable weapons
- 4 differents types of usable characters

## Characters

While playing, you can choose these characters:
- **The colossus: A really resistant guy. But he won't hurt you a lot**
    - Starting life points: 200
    - Starting weapon: Fist
- **The Magu: The healer of the team**
    - Starting life points: 75
    - Starting weapon: Magic Wand
    - Have Magical Power
- **The Dwarf: You have his loyalty. But be carreful, his size is his weakness!**
    - Starting life points: 50
    - Starting weapon: The Axe
- **The Fighter: Classic fighter. A good soldier**
    - Starting life points: 100
    - Starting weapon: The Sword
    
## Weapons

During the game, you can have the luck to find a magic chest containing a new weapon for one of your characters. These are all the weapons you can find in the game:

- **The Sword ⚔️**
    - Type of weapon: Offensive
    - Only suitable for a character with magic power: No
    - Affected points: 10 points taken from the opponent
- **The Magic Wand ✨**
    - Type of weapon: Defensive
    - Only suitable for a character with magic power: Yes
    - Affected points: 15 points given to a member of the team and 30 points of mana taken from the character
- **The Fist 🤜**
    - Type of weapon: Offensive
    - Only suitable for a character with magic power: No
    - Affected points: 5 points taken from the opponent
- **The Axe ⛏**
    - Type of weapon: Offensive
    - Only suitable for a character with magic power: No
    - Affected points: 40 points taken from the opponent
- **The Magic Book 📕**
    - Type of weapon: Defensive
    - Only suitable for a character with magic power: Yes
    - Affected points: full life recover for a member of the team and 80 points of mana taken from the character
- **The Magic Rock 💎**
    - Type of weapon: Defensive
    - Only suitable for a character with magic power: Yes
    - Affected points: Full mana recover for a character with magical power OR magical power given to a non-magical character
- **The Book of the dead  ☠️**
    - Type of weapon: Offensive
    - Only suitable for a character with magic power: Yes
    - Affected points: Instant kill of the opponent. 90 points of mana taken from the character
- **The Magic Potion 🧪**
    - Type of weapon: Defensive
    - Only suitable for a character with magic power: No
    - Affected points: 20 points fiven to a member of the team

## Other informations

A magical character start with 100 points of mana (this is the max given) and each turn will recover them 10 points back

## Code structure

This code is meant to show a correct usage of the Inheritance.
For example, main characteristics of a weapon are on the Weapon class:
```Swift
    //Number of weapon currently available ( Fist is not included..Not really a weapon)
    static let numberOfWeapon = 7
    
    //Does the weapon give point?
    let givePoints: Bool
    //How many points are impacted?
    let affectedPoints: Int
    //What is the type ( name ) of the weapon?
    var type: String
    //Is this a magical weapon?
    let magicalWeapon: Bool
    //How many Mana points are impacted?
    let affectedMana: Int
    //Can the weapon be used more than once?
    let oneTimeWeapon: Bool
```
But all the more precises characteristics are on the child classes. Example with the Sword class:
```Swift
class Sword: Weapon {
    //Caracteristics of the sword
    static let type = "Sword ⚔️"
    static let givePoints = false
    static let magicalWeapon = false
    static let affectedMana = 0
    static let affectedPoints = 10
    static let description = "This Weapon take \(Sword.affectedPoints) points from the opponent"
    static let oneTimeWeapon = false
```
