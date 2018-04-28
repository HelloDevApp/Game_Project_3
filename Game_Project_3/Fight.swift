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
        if let choice = readLine() {
            switch choice {
            case String(1):
                if player.characters.count > 0 {
                    player.attackerCharacter = player.characters[0]
                    communication.verifyTypeAttakers(player: player, charactereNum: 0)
                } else {
                    print(communication.noCharacterValue)
                }
            case String(2):
                if player.characters.count > 1 {
                    player.attackerCharacter = player.characters[1]
                    communication.verifyTypeAttakers(player: player, charactereNum: 1)
                    
                } else {
                    print(communication.noCharacterValue)
                }
            case String(3):
                if player.characters.count > 2 {
                    player.attackerCharacter = player.characters[2]
                    communication.verifyTypeAttakers(player: player, charactereNum: 2)
                    
                } else {
                    print(communication.noCharacterValue)
                }
            default:
                print(communication.noCharacterValue)
            }
        }
    }
    func attackChoiceError(attacker: Players, enemy: Players) {
        print(communication.noCharacterValue)
        print(communication.ignoreValue)
        communication.enterNumberBetween(playerAttacker: attacker, playerEnemy: enemy, attackers: true, enemy: false)
        communication.display2team(playerIndex: attacker, playerNoIndex: enemy)
        
    }
}
