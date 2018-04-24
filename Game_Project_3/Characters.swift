//
//  Characters.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

enum type: String {
    case soldier = "Combattant"
    case magician = "Mâge"
    case colossus = "Colosse"
    case gnome = "Nain"
}
enum weapons: String {
    case soldier = "Épée"
    case magician = "Dague Soignante"
    case colossus = "Poing en Fer"
    case gnome = "Arbalète"
}
enum life: Int {
    case soldier = 100
    case magician = 50
    case colossus = 110
    case gnome = 18
}
enum damages: Int {
    case soldier = 10
    case magician = 9
    case colossus = 7
    case gnome = 21
}





class Characters {
    let idNumber: Int
    var type: type
    var name: String
    var life: life
    var weaponDamages: damages
    var healer: Int?
    var weapon: weapons
    
    init(idNumber: Int,type: type, name: String, life: life, weaponDamages: damages, healer: Int?, weapon: weapons) {
        self.idNumber = idNumber
        self.type = type
        self.name = name
        self.life = life
        self.weaponDamages = weaponDamages
        self.healer = healer
        self.weapon = weapon
    }
}
