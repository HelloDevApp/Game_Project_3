//
//  Players.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Player {
    var playerTeamNumber: Int
    var name: String?
    var charactersNames = [String]()
    var characters = [Characters]()
    var attackerCharacter: Characters?
    var enemyCharacter: Characters?
    var numberTeamCharacters = 0
    
    init(playerTeamNumber: Int) {
        self.playerTeamNumber = playerTeamNumber
    }
    
}
