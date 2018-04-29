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
    //MARK:-Composition Team func
    //Answer team name
    func answerTeamName(player: Players) {
        // the player enters a name
        if let nameTeam = readLine() {
            
            //If the user does not enter a value, an error is displayed and he tries to enter a value correctly.
            if nameTeam.isEmpty {
                print(communication.errorNameIsEmpty)
                communication.messageRequestNameTeam(player: player)
                answerTeamName(player: player)
            } else {
                player.name = nameTeam
            }
            
        }
    }
    func dispayCharactersForComposeTeam() {
        print(communication.soldier)
        print(communication.magician)
        print(communication.colossus)
        print(communication.gnome)
    }
    func answerChoiceCharacterTeam(player: Players) {
        
        if let choiceCharacter = readLine() {
            //we compare the choice with the defined cases to create and add the character that corresponds to the array
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
    func nameCharacters(player: Players, type: type) {
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
    func createCharacter(player: Players, type: type, nameCharacter: String) {
        switch type {
        case .soldier:
            if indexarrayPosition <= 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.soldier.rawValue, weaponDamages: damages.soldier, healer: nil, weapon: weapons.soldier)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        case .magician:
            if indexarrayPosition <= 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.magician.rawValue, weaponDamages: damages.magician, healer: 10, weapon: weapons.magician)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        case .colossus:
            if indexarrayPosition <= 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.colossus.rawValue, weaponDamages: damages.colossus, healer: nil, weapon: weapons.colossus)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        case .gnome:
            if indexarrayPosition <= 3 {
                let character = Characters(indexPosition: indexarrayPosition, idNumber: indexarrayPosition, type: type, name: nameCharacter, life: life.gnome.rawValue, weaponDamages: damages.gnome, healer: nil, weapon: weapons.gnome)
                player.characters.append(character)
                if indexarrayPosition == 2 {
                    indexarrayPosition = 0
                } else {
                    indexarrayPosition += 1
                }
            }
        }
    }
}
