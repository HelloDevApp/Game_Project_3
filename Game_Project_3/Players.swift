//
//  Players.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation
//the player class contains all the properties and methods necessary to create a player
class Players {
    //property that will contain the player's team number
    var playerTeamNumber: Int
    //property that will contain the player's team name
    var name: String?
    //the array that will contain the names of the player's characters
    var charactersNames = [String]()
    //the array that will contain the player's character instances
    var characters = [Characters]()
    //property that will contain the attacker character to use during the attack
    var attackerCharacter: Characters?
    //property that will contain the character who will receive the damage during the attack
    var enemyCharacter: Characters?
    //property that will contain the number of characters on the team
    var numberTeamCharacters = 0
    //array that will contain the number of attacks of each character on the team
    var numberAssault = [0,0,0]
    //array that will contain the number of healing of each characters of the team
    var numberHeal = [0,0,0]
    //array that will contain the multiple healing number of each character on the team
    var numberHealMultiple = [0,0,0]
    //array that will contain the total care damage of each character on the team
    var totalHealPV = [0,0,0]
    //array that will contain the total attack damage of each character on the team
    var totalWeaponDamages = [0,0,0]
    //property that will contain the number of chests received for the player during the game
    var totalNumberChest = 0
    
    init(playerTeamNumber: Int) {
        self.playerTeamNumber = playerTeamNumber
    }
}
