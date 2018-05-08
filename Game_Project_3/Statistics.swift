//
//  Statistics.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 01/05/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

//the statistics class contains a single method that displays a player's statistics
class Statistics {
    
    //method that displays the statistics at the end of the game
    func DiplaysStats(player: Players) {
        //index that displays the corresponding stats of each character at the end of the game
        var index = 0
        print(communication.sceneries1)
        print(communication.sceneries1)
        print("\nJoueur \(player.playerTeamNumber), \(communication.yourStats)\n")
        print("Nombre de coffre: \(player.totalNumberChest)\n")
        
        for _ in 0...2 {
            print(communication.sceneries4)
            print("\(player.charactersNames[index]):")
            print("Nombre D'attaques: \(player.numberAssault[index])")
            print("Total Dégâts: \(player.totalWeaponDamages[index])")
            if player.numberHeal[index] != 0 || player.numberHealMultiple[index] != 0 {
                print("Nombre de soins: \(player.numberHeal[index])")
                print("Nombre de soins multiples: \(player.numberHealMultiple[index])")
                print(communication.sceneries4 + "\n")
            } else {
                print(communication.sceneries4 + "\n")
            }
            index += 1
        }
        print(communication.sceneries1)
        print(communication.sceneries1 + "\n")
    }
}
