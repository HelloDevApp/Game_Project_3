//
//  Chest.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 29/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Chest {
    let weaponsBonus: [WeaponsBonus: Int] = [.woodenArch: 14, .gun: 16, .uAV: Int(arc4random_uniform(3))+17, .c4: Int(arc4random_uniform(3))+19]
    let magicianBonus: [MagicianBonus: Int] = [.plasters: 14, .medicalKit: 16, .smallPotion: Int(arc4random_uniform(3))+17, .BigPotion: Int(arc4random_uniform(3))+19]
    
    func chestRandom(player: Players) {
        let IndexchestAppear: Int = Int(arc4random_uniform(UInt32(6)))
        if IndexchestAppear == 2 || IndexchestAppear == 1 {
            chest.chestAppears(attackers: player.attackerCharacter!)
            player.totalNumberChest += 1
        }
    }
    func chestAppears(attackers: Characters) {
        let indexWeaponsBonus: Int = Int(arc4random_uniform(UInt32(weaponsBonus.count)))
        let indexMagicianBonus: Int = Int(arc4random_uniform(UInt32(magicianBonus.count)))
        
        let arrayWeaponsBonus = Array(weaponsBonus)[indexWeaponsBonus]
        let arrayMagicianBonus = Array(magicianBonus)[indexMagicianBonus]
        
        if attackers.type != .magician {
            //print message discovery of the chest
            print(communication.chestAppears)
            attackers.weapon = arrayWeaponsBonus.key.rawValue
            attackers.weaponDamages = arrayWeaponsBonus.value
            discoverWeaponBonusOrMagicianBonus(character: attackers)
            
        } else {
            //print message discovery of the chest
            print(communication.chestAppears)
            attackers.weapon = arrayMagicianBonus.key.rawValue
            attackers.healer! = arrayMagicianBonus.value
            discoverWeaponBonusOrMagicianBonus(character: attackers)
        }
    }
    func discoverWeaponBonusOrMagicianBonus(character: Characters) {
        if character.type != .magician {
            print("En ouvrant le coffre \(character.name) à trouvé un \(character.weapon)\nDégats: \(character.weaponDamages)Pv\n")
            print("\n\(character.name) s'équipe de la nouvelle arme le temps de l'attaque.\n")
        } else {
            print("En ouvrant le coffre \(character.name) a trouvé des \(character.weapon)\nSoin: \(character.healer!)Pv.\n")
            print("\n\(character.name) s'équipe du nouvel equipement le temps de l'attaque.\n")
        }
    }
    func resetWeaponsCharacter(character: Characters) {
        if character.type == .colossus {
            character.weaponDamages = Damages.colossus.rawValue
        } else if character.type == .magician {
            character.healer = Damages.magicianHealer.rawValue
        } else if character.type == .colossus {
            character.weaponDamages = Damages.colossus.rawValue
        } else {
            character.weaponDamages = Damages.gnome.rawValue
        }
    }
}

