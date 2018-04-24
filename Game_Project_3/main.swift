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
//we create the two players who compose the game
let player_1 = Players(playerTeamNumber: 1)
let player_2 = Players(playerTeamNumber: 2)

//we display the message 'Choose and name 3 characters each your turn'
print(communication.choose3Characters)
game.RequestTeamNameAndChoose(player: player_1)
print(communication.helpChooseCharacter)

game.chooseCharacterTeam(player: player_1)
