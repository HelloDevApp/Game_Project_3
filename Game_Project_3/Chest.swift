//
//  Chest.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 29/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation
//
class Chest {
    //dictionnary that contains bonus weapons and name weapons for all character types except the magician
    let weaponsBonus: [WeaponsBonus: Int] = [.woodenArch: 14, .gun: 16, .uAV: Int(arc4random_uniform(3))+17, .c4: Int(arc4random_uniform(3))+19]
    //dictionnary that contains bonus heal and names weapons for magician
    let magicianBonus: [MagicianBonus: Int] = [.plasters: 14, .medicalKit: 16, .smallPotion: Int(arc4random_uniform(3))+17, .BigPotion: Int(arc4random_uniform(3))+19]
    
    //contains random indexes that will be used to make the chest appear
    func chestRandom(player: Players) {
        let IndexchestAppear: Int = Int(arc4random_uniform(UInt32(6)))
        if IndexchestAppear == 2 || IndexchestAppear == 1 {
            chest.chestAppears(attackers: player.attackerCharacter!)
            player.totalNumberChest += 1
        }
    }
    //is used to make a random bonus box appear for the magician or for the rest of the character types
    func chestAppears(attackers: Characters) {
        //contains the random index which allows to choose a weapon bonus at random in the array
        let indexWeaponsBonus: Int = Int(arc4random_uniform(UInt32(weaponsBonus.count)))
        //contains the random index which allows to choose a heal bonus magician at random in the array
        let indexMagicianBonus: Int = Int(arc4random_uniform(UInt32(magicianBonus.count)))
        //dictionary weapons bonus to array conversion
        let arrayWeaponsBonus = Array(weaponsBonus)[indexWeaponsBonus]
        //dictionary to magicianbonus array conversion
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
    //allows you to display the characters' finds when they open the chest
    func discoverWeaponBonusOrMagicianBonus(character: Characters) {
        if character.type != .magician {
            print("En ouvrant le coffre \(character.name) à trouvé un \(character.weapon)\nDégats: \(character.weaponDamages)Pv\n")
            print("\n\(character.name) s'équipe de la nouvelle arme le temps de l'attaque.\n")
        } else {
            print("En ouvrant le coffre \(character.name) a trouvé des \(character.weapon)\nSoin: \(character.healer!)Pv.\n")
            print("\n\(character.name) s'équipe du nouvel equipement le temps de l'attaque.\n")
        }
    }
    //is used to give back the classic weapon corresponding to the character who finished the attack (only if the character was equipped with a bonus weapon during the attack)
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

