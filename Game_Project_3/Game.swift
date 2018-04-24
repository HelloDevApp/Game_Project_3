//
//  Game.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Game {
    
    //Is used to request the name of a player's team
    func requestTeamName(player: Players) {
        communication.messageNamedCharacter(player: player)
    }
    //Answer team name
    func answerTeamName(player: Players) {
        // the player enters a name
        if let nameTeam = readLine() {
            
            player.charactersNames.append(nameTeam)
            
            //If the user does not enter a value, an error is displayed and he tries to enter a value correctly.
            
            if nameTeam.isEmpty {
                print(communication.errorNameIsEmpty)
                requestTeamName(player: player)
            }
        }
    }
}
