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
                attackersChoice(playerAttacker: player1)
                chooseEnemyForAssault(playerAttacker: player1, playerEnemy: player2)
            }
            if player2.characters.count > 0 {
                communication.playerTurn(player: player2)
                print(communication.selectedAnAttacker)
                communication.display2team(playerIndex: player2, playerNoIndex: player1)
                attackersChoice(playerAttacker: player2)
            }
        }
    }
    func attackersChoice(playerAttacker: Players) {
        if let choice = readLine() {
            switch choice {
            case String(1):
                if playerAttacker.characters.count > 0 {
                    playerAttacker.attackerCharacter = playerAttacker.characters[0]
                    communication.verifyTypeAttakers(player: playerAttacker, charactereNum: 0)
                } else {
                    print(communication.noCharacterValue)
                }
            case String(2):
                if playerAttacker.characters.count > 1 {
                    playerAttacker.attackerCharacter = playerAttacker.characters[1]
                    communication.verifyTypeAttakers(player: playerAttacker, charactereNum: 1)
                    
                } else {
                    print(communication.noCharacterValue)
                }
            case String(3):
                if playerAttacker.characters.count > 2 {
                    playerAttacker.attackerCharacter = playerAttacker.characters[2]
                    communication.verifyTypeAttakers(player: playerAttacker, charactereNum: 2)
                    
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
        attackersChoice(playerAttacker: attacker)
        
    }
    func displayTeam(player: Players, index: Bool) {
        var i = 1
        if index == true {
            for perso in player.characters {
                if perso.healer != nil {
                    print("\n\(i).Nom: \(perso.name)\n Type: \(perso.type.rawValue)\n Vie: \(perso.life)Pv\n Dégats: \(perso.weaponDamages.rawValue)Pv\n soin: \(perso.healer!)Pv par Soin")
                } else {
                    print("\n\(i)Nom: \(perso.name)\nType: \(perso.type.rawValue)\n Vie: \(perso.life)Pv\n Dégats: \(perso.weaponDamages.rawValue)Pv\n Soin: Non")
                }
                i += 1
            }
        } else {
            for perso in player.characters {
                if perso.healer != nil {
                    print("\nNom: \(perso.name)\nType: \(perso.type.rawValue)\nVie: \(perso.life)Pv\nDégats: \(perso.weaponDamages.rawValue)Pv\nSoin: \(perso.healer!)Pv par Soin")
                } else {
                    print("\nNom: \(perso.name)\nType: \(perso.type.rawValue)\nVie: \(perso.life)Pv\nDégats: \(perso.weaponDamages.rawValue)Pv\nSoin: NON")
                }
            }
        }
    }
    func chooseEnemyForAssault(playerAttacker: Players, playerEnemy: Players) {
        if let attackerChoice = readLine() {
            switch attackerChoice {
            case String(1):
                if playerEnemy.characters.count > 0 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[0].idNumber]
                    fight.assault(attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(2):
                if playerEnemy.characters.count > 1 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[1].idNumber]
                    fight.assault(attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(3):
                if playerEnemy.characters.count > 2 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[2].idNumber]
                    fight.assault(attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    print(communication.errorTerm)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            default:
                print(communication.errorTerm)
                chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
            }
        }
    }
    func assault(attacker: Characters, enemy: Characters) {
        enemy.life -= attacker.weaponDamages.rawValue
        //stats de l'attaque
    }
}
