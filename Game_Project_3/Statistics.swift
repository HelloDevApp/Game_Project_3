//
//  Statistics.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 01/05/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Statistics {
    func DiplaysStats(player: Players) {
        var index = 0
        print(communication.yourStats + "\n")
        print("Joueur \(player.playerTeamNumber):\n")
        print("Nombre de coffre: \(player.totalNumberChest)")
        for _ in 0...2 {
            print(communication.sceneries3)
            print("\(player.charactersNames[index]):")
            print("Total Dégâts: \(player.totalWeaponDamages[index])")
            print("Nombre D'attaques: \(player.numberAssault[index])")
            if player.numberHeal[index] != 0 || player.numberHealMultiple[index] != 0 {
                print("Nombre de soins: \(player.numberHeal[index])")
                print("Nombre de soins multiples: \(player.numberHealMultiple[index])")
                print(communication.sceneries3 + "\n")
            } else {
                print(communication.sceneries3 + "\n")
            }
            index += 1
        }
    }
}
