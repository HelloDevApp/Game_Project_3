//
//  Characters.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation
enum typeCharacter {
    case soldier
    case magician
    case colossus
    case gnome
}
class Characters {
    var name: String
    var life: Int
    var damages: Int
    var healer: Int?
    
    init(name: String, life: Int, damages: Int, healer: Int?) {
        self.name = name
        self.life = life
        self.damages = damages
        self.healer = healer
    }
}
