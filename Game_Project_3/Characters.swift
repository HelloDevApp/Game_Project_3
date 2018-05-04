//
//  Characters.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

enum Type: String {
    case soldier = "Combattant"
    case magician = "Mâge"
    case colossus = "Colosse"
    case gnome = "Nain"
}
enum Weapons: String {
    case soldier = "Épée"
    case magician = "Dague Soignante"
    case colossus = "Poing en Fer"
    case gnome = "Arbalète"
}
enum Life: Int {
    case soldier = 100
    case magician = 50
    case colossus = 110
    case gnome = 60
}
enum Damages: Int {
    case soldier = 10
    case magicianWeapon = 8
    case magicianHealer = 12
    case colossus = 9
    case gnome = 15
}
enum WeaponsBonus: String {
    case woodenArch = "Arc-En-Bois"
    case gun = "Pistolet"
    case uAV = "Drone"
    case c4 = "Kit Explosif"
}
enum MagicianBonus: String {
    case plasters = "Pansements"
    case medicalKit = "Kits Médical"
    case smallPotion = "Petite Potions"
    case BigPotion = "Grande Potions"
}
//class that is used to create characters
//all properties of this class are initialized when creating character instances
class Characters {
    
    //will contain the position index of a character in real time
    var indexPosition: Int
    //the id number of a character serves as a number plate to display the stats of the corresponding character
    let idNumber: Int
    //enumeration that would define the character type
    var type: Type
    //contain the character's name
    var name: String
    //contains the life of the characters
    var life: Int
    //contains the damage the character's weapon causes
    var weaponDamages: Damages.RawValue
    //contains the number of health points that the heal regenerates
    var healer: Int?
    //contains the names of the weapons for each of the characters types
    var weapon: Weapons.RawValue
    
    
    init(indexPosition: Int, idNumber: Int, type: Type, name: String, life: Int, weaponDamages: Int, healer: Int?, weapon: String) {
        self.indexPosition = indexPosition
        self.idNumber = idNumber
        self.type = type
        self.name = name
        self.life = life
        self.weaponDamages = weaponDamages
        self.healer = healer
        self.weapon = weapon
    }
}
