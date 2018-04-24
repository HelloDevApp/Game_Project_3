//
//  Game.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Game {
    
    func mainRequestTeamName(player: Players) {
        //we display the message 'Player *: enter a name for your team'
        communication.messageRequestNameTeam(player: player)
        //°°°°°°°°°°player * chooses a name for her team°°°°°°°°°°°°°°°
        game.answerTeamName(player: player)
        //we display the message  'player * your team is named \(nameTeam)'
        communication.teamNameIs(player: player)
    }
   
    //Answer team name
    func answerTeamName(player: Players) {
        // the player enters a name
        if let nameTeam = readLine() {
            //If the user does not enter a value, an error is displayed and he tries to enter a value correctly.
            if nameTeam.isEmpty {
                print(communication.errorNameIsEmpty)
                mainRequestTeamName(player: player)
            }
            player.name = nameTeam
        }
    }
}
