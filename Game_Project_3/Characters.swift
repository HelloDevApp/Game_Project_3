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
    case gnome = 18
}
enum Damages: Int {
    case soldier = 10
    case magicianWeapon = 9
    case magicianHealer = 12
    case colossus = 8
    case gnome = 19
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
class Characters {
    var indexPosition: Int
    let idNumber: Int
    var type: Type
    var name: String
    var life: Int
    var weaponDamages: Damages.RawValue
    var healer: Int?
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
