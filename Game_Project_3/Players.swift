//
//  Players.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Players {
    var playerTeamNumber: Int
    var name: String?
    var charactersNames = [String]()
    var characters = [Characters]()
    var attackerCharacter: Characters?
    var enemyCharacter: Characters?
    var numberTeamCharacters = 0
    
    var numberAssault = [0,0,0]
    var numberHeal = [0,0,0]
    var totalWeaponDamages = [0,0,0]
    var totalNumberChest = 0
    
    init(playerTeamNumber: Int) {
        self.playerTeamNumber = playerTeamNumber
    }
}
