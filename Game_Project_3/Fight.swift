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
        while player1.characters.count != 0 && player2.characters.count != 0 {
            if player1.characters.count > 0 && player2.characters.count != 0 {
                communication.playerTurn(player: player1)
                print(communication.selectedAnAttacker)
                communication.display2team(playerIndex: player1, playerNoIndex: player2)
                attackersChoice(playerAttacker: player1, playerEnemy: player2)
                let IndexchestAppear: Int = Int(arc4random_uniform(UInt32(6)))
                if IndexchestAppear == 2 || IndexchestAppear == 1 {
                    chest.chestAppears(attackers: player1.attackerCharacter!)
                }
                print(communication.selectedAnEnemy)
                chooseEnemyForAssault(playerAttacker: player1, playerEnemy: player2)
                chest.resetWeaponsCharacter(character: player1.attackerCharacter!)
            }
            
            if player2.characters.count > 0 && player1.characters.count != 0 {
                communication.playerTurn(player: player2)
                print(communication.selectedAnAttacker)
                communication.display2team(playerIndex: player2, playerNoIndex: player1)
                attackersChoice(playerAttacker: player2, playerEnemy: player1)
                let IndexchestAppear: Int = Int(arc4random_uniform(UInt32(6)))
                if IndexchestAppear == 2 || IndexchestAppear == 1 {
                    chest.chestAppears(attackers: player2.attackerCharacter!)
                }
                print(communication.selectedAnEnemy)
                chooseEnemyForAssault(playerAttacker: player2, playerEnemy: player1)
                chest.resetWeaponsCharacter(character: player2.attackerCharacter!)
            }
        }
        if player2.characters.count == 0 {
            communication.showTheWinner(player: player1)
        } else {
            communication.showTheWinner(player: player2)
        }
    }
    func attackersChoice(playerAttacker: Players, playerEnemy: Players) {
        if let choice = readLine() {
            switch choice {
            case String(1):
                if playerAttacker.characters.count > 0 {
                    playerAttacker.attackerCharacter = playerAttacker.characters[0]
                    communication.verifyTypeAttakers(player: playerAttacker, charactereNum: 0)
                } else {
                    attackChoiceError(attacker: playerAttacker, enemy: playerEnemy)
                }
            case String(2):
                if playerAttacker.characters.count > 1 {
                    playerAttacker.attackerCharacter = playerAttacker.characters[1]
                    communication.verifyTypeAttakers(player: playerAttacker, charactereNum: 1)
                    
                } else {
                    attackChoiceError(attacker: playerAttacker, enemy: playerEnemy)
                }
            case String(3):
                if playerAttacker.characters.count > 2 {
                    playerAttacker.attackerCharacter = playerAttacker.characters[2]
                    communication.verifyTypeAttakers(player: playerAttacker, charactereNum: 2)
                    
                } else {
                    attackChoiceError(attacker: playerAttacker, enemy: playerEnemy)
                }
            default:
                attackChoiceError(attacker: playerAttacker, enemy: playerEnemy)
            }
        }
    }
    func attackChoiceError(attacker: Players, enemy: Players) {
        print(communication.ignoreValue)
        communication.enterNumberBetween(playerAttacker: attacker, playerEnemy: enemy, attackers: true, enemy: false)
        communication.display2team(playerIndex: attacker, playerNoIndex: enemy)
        attackersChoice(playerAttacker: attacker, playerEnemy: enemy)
    }
    func chooseEnemyForAssault(playerAttacker: Players, playerEnemy: Players) {
        communication.displayTeam(player: playerEnemy, index: true)
        if let attackerChoice = readLine() {
            switch attackerChoice {
            case String(1):
                if playerEnemy.characters.count > 0 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[0].indexPosition]
                    fight.assault(playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(2):
                if playerEnemy.characters.count > 1 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[1].indexPosition]
                    fight.assault(playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(3):
                if playerEnemy.characters.count > 2 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[2].indexPosition]
                    fight.assault(playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            default:
                print(communication.bigTextSeparation + communication.errorTerm)
                chooseEnemyForAssaultError(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
            }
        }
    }
    func chooseEnemyForAssaultError(playerAttacker: Players, playerEnemy: Players) {
        print(communication.ignoreValue)
        communication.enterNumberBetween(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attackers: false, enemy: true)
        chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
    }
    func assault(playerEnemy: Players, attacker: Characters, enemy: Characters) {
        enemy.life -= attacker.weaponDamages
        communication.attackInformation(playerEnemy: playerEnemy, attacker: attacker, enemy: enemy)
    }
    func deleteCharacterArray(player: Players, character: Characters) {
        player.characters.remove(at: character.indexPosition)
    }
    func changeIndexPosition(player: Players) {
        var i = 0
        for character in player.characters {
            character.indexPosition = i
            i += 1
        }
    }
}
