//
//  Game.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

//the Game class contains the methods used to manage the first part of the game before starting the fight (ask the player to name his team, characters, etc...) 
class Game {
    
    //contains the position index of a character in the array and increment by 1 for each character creation
    var indexarrayPosition = 0
    
    //=================================================
    //MARK:-Composition Team func
    //=================================================
    
    //method that allows the player to enter a name for his team
    func answerTeamName(player: Players) {
        //the player enters a name for his team
        if let nameTeam = readLine() {
            //If the user does not enter a value, an error is displayed and he tries to enter a value correctly.
            if nameTeam.isEmpty {
                print(communication.errorNameIsEmpty)
                communication.messageRequestNameTeam(player: player)
                answerTeamName(player: player)
            //if nameTeam does not have empty, then the name of the team is assigned to the player
            } else {
                player.name = nameTeam
            }
            
        }
    }
    //is used to display the characters that you can choose when composing the team
    func dispayCharactersForComposeTeam() {
        print(communication.soldier)
        print(communication.magician)
        print(communication.colossus)
        print(communication.gnome)
    }
    
    //the player makes his choice and the method manages the various cases of creation of characters as well as the possible cases of errors
    func answerChoiceCharacterTeam(player: Players) {
        //the player makes his choice
        if let choiceCharacter = readLine() {
            //we compare the choice with the defined cases to create, named and add the character that corresponds to the array
            switch choiceCharacter {
            case String(1):
                print(communication.messageNamedCharacter(character: .soldier))
                nameCharacters(player: player, type: .soldier)
            case String(2):
                print(communication.messageNamedCharacter(character: .magician))
                nameCharacters(player: player, type: .magician)
            case String(3):
                print(communication.messageNamedCharacter(character: .colossus))
                nameCharacters(player: player, type: .colossus)
            case String(4):
                print(communication.messageNamedCharacter(character: .gnome))
                nameCharacters(player: player, type: .gnome)
                
            default:
                print(communication.errorTerm)
                communication.helpChooseCharacter(player: player)
                dispayCharactersForComposeTeam()
                answerChoiceCharacterTeam(player: player)
            }
        }
    }
    /* method which takes a player as a parameter to avoid code repetition and which groups the following three actions: 1. displays the available character types 2. the player makes his choice. 3.name the character + character creation */
    func chooseCharacterTeam(player: Players) {
        while player.numberTeamCharacters < 3 {
            //we display the type of characters
            dispayCharactersForComposeTeam()
            //the player makes his choice
            answerChoiceCharacterTeam(player: player)
            player.numberTeamCharacters += 1
            if player.numberTeamCharacters != 3 {
                communication.chooseAgainCharacter(player: player)
            }
        }
    }
    //method that is used to name the character chosen during the team composition then who creates the characters with the type previously chosen
    func nameCharacters(player: Players, type: Type) {
        //the player chooses a name for the type of characters chosen
        if let nameCharacter = readLine() {
            if player_1.charactersNames.contains(nameCharacter) || player_2.charactersNames.contains(nameCharacter) {
                print(communication.nameAlreadyExists)
                nameCharacters(player: player, type: type)
            } else if nameCharacter.isEmpty {
                print(communication.errorNameIsEmpty)
                nameCharacters(player: player, type: type)
            } else {
                player.charactersNames.append(nameCharacter)
                createCharacter(player: player, type: type, nameCharacter: nameCharacter)
            }
        }
    }
    //method to create and add a character in the player's character array + manage character position indexes in the array
    func createCharacter(player: Players, type: Type, nameCharacter: String) {
        switch type {
        case .soldier:
            if indexarrayPosition <= 3 {
                //creation of a soldier
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: Life.soldier.rawValue, weaponDamages: Damages.soldier.rawValue, healer: nil, weapon: Weapons.soldier.rawValue)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        case .magician:
            if indexarrayPosition <= 3 {
                //creation of a magician
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: Life.magician.rawValue, weaponDamages: Damages.magicianWeapon.rawValue, healer: Damages.magicianHealer.rawValue, weapon: Weapons.magician.rawValue)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        case .colossus:
            if indexarrayPosition <= 3 {
                //creation of a colossus
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: Life.colossus.rawValue, weaponDamages: Damages.colossus.rawValue, healer: nil, weapon: Weapons.colossus.rawValue)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        case .gnome:
            if indexarrayPosition <= 3 {
                //creation of a Gnome
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: Life.gnome.rawValue, weaponDamages: Damages.gnome.rawValue, healer: nil, weapon: Weapons.gnome.rawValue)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        }
    }
    //method that resets all properties and tables necessary to restart a game
    func resetForNewGame(player: Players) {
        player.name = nil
        player.characters = []
        player.numberTeamCharacters = 0
        player.charactersNames = []
        player.attackerCharacter = nil
        player.enemyCharacter = nil
        player.numberAssault = [0,0,0]
        player.numberHeal = [0,0,0]
        player.numberHealMultiple = [0,0,0]
        player.totalHealPV = [0,0,0]
        player.totalNumberChest = 0
        player.totalWeaponDamages = [0,0,0]
    }
    //method that asks the players if they want to play again or not
    func restartOrQuit() {
        print(communication.requestToRestart)
        if let choice = readLine() {
            switch choice {
            case String(1):
                print(communication.bigTextSeparation + communication.bigTextSeparation)
                launchGame()
            case String(2):
                break
            default:
                print(communication.errorTerm)
                restartOrQuit()
            }
        }
    }
    //method to start a game
    func launchGame() {
        //we display the message 'Choose and name 3 characters each your turn'
        print(communication.choose3Characters)
        //we display the message 'Player *: enter a name for your team'
        communication.messageRequestNameTeam(player: player_1)
        //°°°°°°°°°°player * chooses a name for her team°°°°°°°°°°°°°°°
        game.answerTeamName(player: player_1)
        //we display the message  'player * your team is named \(nameTeam)'
        communication.messageTeamNameIs(player: player_1)
        
        //a message is displayed that helps the player to choose a character
        communication.helpChooseCharacter(player: player_1)
        //the player chooses his characters
        game.chooseCharacterTeam(player: player_1)
        //a message is posted to notify that the team is complete
        communication.teamFull(player: player_1)
        
        //we display the message 'Player *: enter a name for your team'
        communication.messageRequestNameTeam(player: player_2)
        //°°°°°°°°°°player * chooses a name for her team°°°°°°°°°°°°°°°
        game.answerTeamName(player: player_2)
        //we display the message  'player * your team is named \(nameTeam)'
        communication.messageTeamNameIs(player: player_2)
        
        //a message is displayed that helps the player to choose a character
        communication.helpChooseCharacter(player: player_2)
        //the player chooses his characters
        game.chooseCharacterTeam(player: player_2)
        //a message is posted to notify that the team is complete
        communication.teamFull(player: player_2)
        
        //We alert the players that we're ready to fight.
        print(communication.fightReady)
        //the fight starts.
        fight.startFight(player1: player_1, player2: player_2)
        
        //display game stats for each players
        communication.DiplaysStats(player: player_1)
        communication.DiplaysStats(player: player_2)
        
        //we reset the stats + team name... for each player
        game.resetForNewGame(player: player_1)
        game.resetForNewGame(player: player_2)
        
        //the player chosen to play again or not
        game.restartOrQuit()
    }
}
