//
//  Characters.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

enum type {
    case soldier
    case magician
    case colossus
    case gnome
}
enum life: Int {
    case soldier = 100
    case magician = 50
    case colossus = 110
    case gnome = 18
}
enum damages {
    case soldier
    case magician
    case colossus
    case gnome
}
enum weapons: String {
    case soldier = "Épée"
    case magician = "Dague Soignante"
    case colossus = "Poing en Fer"
    case gnome = "Arbalète"
}





class Characters {
    var name: String
    var life: Int
    var damages: Int
    var healer: Int?
    var weapon:
    
    init(name: String, life: Int, damages: Int, healer: Int?) {
        self.name = name
        self.life = life
        self.damages = damages
        self.healer = healer
    }
}
