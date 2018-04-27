//
//  Fight.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 27/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation
class Fight {
    func startFight(player1: Players, player2: Players) {
        while player1.characters.count != 0 || player2.characters.count != 0 {
            if player1.characters.count > 0 {
                communication.playerTurn(player: player1)
                print(communication.selectedAnAttacker)
                communication.display2team(playerIndex: player1, playerNoIndex: player2)
            }
            if player2.characters.count > 0 {
                communication.playerTurn(player: player2)
                print(communication.selectedAnAttacker)
                communication.display2team(playerIndex: player2, playerNoIndex: player1)
            }
        }
    }
    func attackersChoice(player: Players) {
        
    }
}
