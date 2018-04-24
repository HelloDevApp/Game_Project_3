//
//  Game.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Game {
    var indexarrayPosition = 0
    
    
    func RequestTeamNameAndChoose(player: Players) {
        //we display the message 'Player *: enter a name for your team'
        communication.messageRequestNameTeam(player: player)
        //°°°°°°°°°°player * chooses a name for her team°°°°°°°°°°°°°°°
        game.answerTeamName(player: player)
        //we display the message  'player * your team is named \(nameTeam)'
        communication.messageTeamNameIs(player: player)
    }
   
    //Answer team name
    func answerTeamName(player: Players) {
        // the player enters a name
        if let nameTeam = readLine() {
            
            //If the user does not enter a value, an error is displayed and he tries to enter a value correctly.
            if nameTeam.isEmpty {
                print(communication.errorNameIsEmpty)
                RequestTeamNameAndChoose(player: player)
                
            } else {
                player.name = nameTeam
            }
            
        }
    }
    func dispayCharacters() {
        print(communication.soldierFull)
        print(communication.magicianFull)
        print(communication.colossusFull)
        print(communication.gnomeFull)
    }
    func answerChoiceCharacterTeam(player: Players) {
        
        if let choiceCharacter = readLine() {
            //we compare the choice with the defined cases to create and add the character that corresponds to the array
            switch choiceCharacter {
            case String(1):
                print(communication.messageNamedCharacter(character: .soldier))
                nameCharacterAndCreate(player: player, type: .soldier)
            case String(2):
                print(communication.messageNamedCharacter(character: .magician))
                nameCharacterAndCreate(player: player, type: .magician)
            case String(3):
                print(communication.messageNamedCharacter(character: .colossus))
                nameCharacterAndCreate(player: player, type: .colossus)
            case String(4):
                print(communication.messageNamedCharacter(character: .gnome))
                nameCharacterAndCreate(player: player, type: .gnome)
                
            default:
                print(communication.errorTerm)
            }
        }
    }
    func chooseCharacterTeam(player: Players) {
        while player_1.numberTeamCharacters < 3 {
            //we display the type of characters
            dispayCharacters()
            //the player makes his choice
            answerChoiceCharacterTeam(player: player)
        }
    }
    func nameCharacterAndCreate(player: Players, type: type) {
        if let nameCharacter = readLine() {
            if player_1.charactersNames.contains(nameCharacter) || player_2.charactersNames.contains(nameCharacter) {
                print(communication.nameAlreadyExists)
                nameCharacterAndCreate(player: player, type: type)
            } else if nameCharacter.isEmpty {
                print(communication.errorNameIsEmpty)
                nameCharacterAndCreate(player: player, type: type)
            } else {
                createCharacter(player: player, type: type, nameCharacter: nameCharacter)
            }
            
        }
    }
    func createCharacter(player: Players, type: type, nameCharacter: String) {
        switch type {
        case .soldier:
            if indexarrayPosition < 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.soldier, weaponDamages: damages.soldier, healer: nil, weapon: weapons.soldier)
                indexarrayPosition += 1
                
                player.characters.append(character)
            } else {
                indexarrayPosition = 0
            }
            
        case .magician:
            if indexarrayPosition < 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.magician, weaponDamages: damages.magician, healer: 10, weapon: weapons.magician)
                indexarrayPosition += 1
                player.characters.append(character)
            } else {
                indexarrayPosition = 0
            }
        case .colossus:
            if indexarrayPosition < 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.colossus, weaponDamages: damages.colossus, healer: nil, weapon: weapons.colossus)
                indexarrayPosition += 1
                player.characters.append(character)
                
            } else {
                indexarrayPosition = 0
            }
        case .gnome:
            if indexarrayPosition < 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.gnome, weaponDamages: damages.gnome, healer: nil, weapon: weapons.gnome)
                indexarrayPosition += 1
                player.characters.append(character)
            } else {
                indexarrayPosition = 0
            }
            
        }
    }
}
