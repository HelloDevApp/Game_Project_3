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
                chest.chestRandom(player: player1)
                if player1.attackerCharacter!.type == .magician {
                    choiceMagician(playerAttacker: player1, playerEnemy: player2, attatckerOrHeal: player1.attackerCharacter!)
                } else {
                    print(communication.selectedAnEnemy)
                    chooseEnemyForAssault(playerAttacker: player1, playerEnemy: player2)
                    chest.resetWeaponsCharacter(character: player1.attackerCharacter!)
                }
            }
            if player2.characters.count > 0 && player1.characters.count != 0 {
                communication.playerTurn(player: player2)
                print(communication.selectedAnAttacker)
                communication.display2team(playerIndex: player2, playerNoIndex: player1)
                attackersChoice(playerAttacker: player2, playerEnemy: player1)
                chest.chestRandom(player: player2)
                if player2.attackerCharacter!.type == .magician {
                    choiceMagician(playerAttacker: player2, playerEnemy: player1, attatckerOrHeal: player2.attackerCharacter!)
                } else {
                    print(communication.selectedAnEnemy)
                    chooseEnemyForAssault(playerAttacker: player2, playerEnemy: player1)
                    chest.resetWeaponsCharacter(character: player2.attackerCharacter!)
                }
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
        if let enemyChoice = readLine() {
            switch enemyChoice {
            case String(1):
                if playerEnemy.characters.count > 0 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[0].indexPosition]
                    fight.assault(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(2):
                if playerEnemy.characters.count > 1 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[1].indexPosition]
                    fight.assault(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(3):
                if playerEnemy.characters.count > 2 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[2].indexPosition]
                    fight.assault(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
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
    func choiceMagician(playerAttacker: Players, playerEnemy: Players, attatckerOrHeal: Characters) {
        print(communication.assaultOrHeal)
        if let choice = readLine() {
            switch choice {
            case String(1):
                print(communication.selectedAnEnemy)
                chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                chest.resetWeaponsCharacter(character: attatckerOrHeal)
            case String(2):
                chooseCharaForHeal(player: playerAttacker)
                chest.resetWeaponsCharacter(character: attatckerOrHeal)
                
            case String(3):
                if playerAttacker.characters.count > 1 {
                    fight.healMultiple(playerAttacker: playerAttacker, healer: attatckerOrHeal)
                    chest.resetWeaponsCharacter(character: attatckerOrHeal)
                } else {
                    print(communication.errorTerm)
                    choiceMagician(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attatckerOrHeal: attatckerOrHeal)
                }
            default:
                print(communication.errorTerm)
                choiceMagician(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attatckerOrHeal: attatckerOrHeal)
            }
        }
    }
    func assault(playerAttacker: Players, playerEnemy: Players, attacker: Characters, enemy: Characters) {
        enemy.life -= attacker.weaponDamages
        playerAttacker.numberAssault[attacker.idNumber] += 1
        playerAttacker.totalWeaponDamages[attacker.idNumber] += attacker.weaponDamages
        communication.attackInformation(playerEnemy: playerEnemy, attacker: attacker, enemy: enemy)
    }
    func chooseCharaForHeal(player: Players) {
        print(communication.selectedCharaToHeal)
        communication.displayTeam(player: player, index: true)
        if let answer = readLine() {
            switch answer {
            case String(1):
                fight.heal(player: player, healer: player.attackerCharacter!, characterToHeal: player.characters[0])
            case String(2):
                if player.characters.count > 1 {
                    fight.heal(player: player, healer: player.attackerCharacter!, characterToHeal: player.characters[1])
                } else {
                    print(communication.errorTerm)
                    chooseCharaForHeal(player: player)
                }
            case String(3):
                if player.characters.count > 2 {
                    fight.heal(player: player, healer: player.attackerCharacter!, characterToHeal: player.characters[2])
                } else {
                    print(communication.errorTerm)
                    chooseCharaForHeal(player: player)
                }
            default:
                print(communication.errorTerm)
                chooseCharaForHeal(player: player)
            }
        }
        
    }
    func heal(player: Players,healer: Characters, characterToHeal: Characters) {
        characterToHeal.life += healer.healer!
        player.numberHeal[healer.idNumber] += 1
        player.totalHealPV[healer.idNumber] += healer.healer!
        communication.healInformation(player: player, healer: healer, characterToHeal: characterToHeal, healMultiple: false)
    }
    func healMultiple(playerAttacker: Players, healer: Characters) {
        for character in playerAttacker.characters {
            character.life += healer.healer! / playerAttacker.characters.count
            communication.healInformation(player: playerAttacker, healer: healer, characterToHeal: character, healMultiple: true)
        }
        playerAttacker.numberHealMultiple[healer.idNumber] += 1
        playerAttacker.totalHealPV[healer.idNumber] += healer.healer!
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
