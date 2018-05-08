//
//  Game.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

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
}
