//
//  main.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation
//we create a communication instance to be used.
let communication = Communication()
//we create a game
let game = Game()
//create player 1
let player_1 = Players(playerTeamNumber: 1)
//create player 2
let player_2 = Players(playerTeamNumber: 2)
//we create a fight
let fight = Fight()
//we create a chest
let chest = Chest()
//create statistics for player 1 and player 2
let stats = Statistics()


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
//display game stats for each player
stats.DiplaysStats(player: player_1)
stats.DiplaysStats(player: player_2)


