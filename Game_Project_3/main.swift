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

game.launchGame()

