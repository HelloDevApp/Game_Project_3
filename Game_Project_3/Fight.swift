//
//  Fight.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 27/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

//the fight class contains all the properties and method necessary for combat
class Fight {
    
    //call method when players' teams are full and who launches a fight until a player has no more characters + show the winner
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
    //feature that allows players to choose an attacking character to perform an attack or healing
    func attackersChoice(playerAttacker: Players, playerEnemy: Players) {
        //the player chooses his attacker
        if let choice = readLine() {
            //we compare the choice to the defined case
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
    //this method is called if the player enters an incorrect caracter during the choice of an attacking character and who asks again to make a choice
    func attackChoiceError(attacker: Players, enemy: Players) {
        print(communication.ignoreValue)
        communication.enterNumberBetween(playerAttacker: attacker, playerEnemy: enemy, attackers: true, enemy: false)
        communication.display2team(playerIndex: attacker, playerNoIndex: enemy)
        attackersChoice(playerAttacker: attacker, playerEnemy: enemy)
    }
    //method that allows players to choose an enemy character to serve as an enemy during the attack
    func chooseEnemyForAssault(playerAttacker: Players, playerEnemy: Players) {
        communication.displayTeam(player: playerEnemy, index: true)
        //the player chooses an enemy character
        if let enemyChoice = readLine() {
            //we compare the choice to the defined case
            switch enemyChoice {
            case String(1):
                if playerEnemy.characters.count > 0 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[0].indexPosition]
                    fight.assault(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    chooseEnemyForAssaultError(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(2):
                if playerEnemy.characters.count > 1 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[1].indexPosition]
                    fight.assault(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    chooseEnemyForAssaultError(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            case String(3):
                if playerEnemy.characters.count > 2 {
                    playerAttacker.enemyCharacter = playerEnemy.characters[playerEnemy.characters[2].indexPosition]
                    fight.assault(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attacker: playerAttacker.attackerCharacter!, enemy: playerAttacker.enemyCharacter!)
                } else {
                    chooseEnemyForAssaultError(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                    chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                }
            default:
                chooseEnemyForAssaultError(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
            }
        }
    }
    //call method if the player enters an incorrect choice and asks him to make a correct one again
    func chooseEnemyForAssaultError(playerAttacker: Players, playerEnemy: Players) {
        print(communication.bigTextSeparation)
        print(communication.errorTerm)
        communication.enterNumberBetween(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attackers: false, enemy: true)
    }
    //if the attacking character is a magician he can choose between attacking, healing or performing a multiple healing
    func choiceMagician(playerAttacker: Players, playerEnemy: Players, attatckerOrHeal: Characters) {
        print(communication.assaultOrHeal)
        //the player makes his choice
        if let choice = readLine() {

            switch choice {
                //Attack Case
            case String(1):
                print(communication.selectedAnEnemy)
                chooseEnemyForAssault(playerAttacker: playerAttacker, playerEnemy: playerEnemy)
                chest.resetWeaponsCharacter(character: attatckerOrHeal)
                //Heal Case
            case String(2):
                if playerAttacker.characters.count > 1 {
                    chooseCharaForHeal(player: playerAttacker)
                    chest.resetWeaponsCharacter(character: attatckerOrHeal)
                } else {
                    
                    heal(player: playerAttacker, healer: attatckerOrHeal, characterToHeal: attatckerOrHeal)
                }
                //Heal Multiple Case
            case String(3):
                if playerAttacker.characters.count > 1 {
                    fight.healMultiple(playerAttacker: playerAttacker, healer: attatckerOrHeal)
                    chest.resetWeaponsCharacter(character: attatckerOrHeal)
                } else {
                    print(communication.oneCharacterToHeal)
                    fight.healMultiple(playerAttacker: playerAttacker, healer: attatckerOrHeal)
                    chest.resetWeaponsCharacter(character: attatckerOrHeal)
                }
            default:
                print(communication.errorTerm + "\n" + communication.choiceMagicianErrorValue)
                choiceMagician(playerAttacker: playerAttacker, playerEnemy: playerEnemy, attatckerOrHeal: attatckerOrHeal)
            }
        }
    }
    //method used to launch the attack once the attacker and the enemy were chosen
    func assault(playerAttacker: Players, playerEnemy: Players, attacker: Characters, enemy: Characters) {
        enemy.life -= attacker.weaponDamages
        playerAttacker.numberAssault[attacker.idNumber] += 1
        playerAttacker.totalWeaponDamages[attacker.idNumber] += attacker.weaponDamages
        communication.attackInformation(playerEnemy: playerEnemy, attacker: attacker, enemy: enemy)
    }
    //method that allows the player to choose a character from his team to heal. (replaces the moment or the player chosen an enemy)
    func chooseCharaForHeal(player: Players) {
        print(communication.selectedCharaToHeal)
        communication.displayTeam(player: player, index: true)
        //the player chooses the character to heal
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
    //method that is used to heal once the character to heal is chosen
    func heal(player: Players,healer: Characters, characterToHeal: Characters) {
        characterToHeal.life += healer.healer!
        player.numberHeal[healer.idNumber] += 1
        player.totalHealPV[healer.idNumber] += healer.healer!
        communication.healInformation(player: player, healer: healer, characterToHeal: characterToHeal, healMultiple: false)
        print(communication.textSeparation)
    }
    //method that is used to heal a chosen character
    func healMultiple(playerAttacker: Players, healer: Characters) {
        print(communication.textSeparation + communication.textSeparation)
        for character in playerAttacker.characters {
            character.life += healer.healer! / playerAttacker.characters.count
            communication.healInformation(player: playerAttacker, healer: healer, characterToHeal: character, healMultiple: true)
        }
        print(communication.textSeparation + communication.textSeparation)
        playerAttacker.numberHealMultiple[healer.idNumber] += 1
        playerAttacker.totalHealPV[healer.idNumber] += healer.healer!
    }
    //method that is used to remove a character from a team when it is dead
    func deleteCharacterArray(player: Players, character: Characters) {
        player.characters.remove(at: character.indexPosition)
    }
    //method that is used to refresh the positon index of characters in the board just after deleting a dead character
    func changeIndexPosition(player: Players) {
        //i is used as an index to start from 0 every time the method is called and incremented at each loop turn
        var i = 0
        for character in player.characters {
            character.indexPosition = i
            i += 1
        }
    }
}
