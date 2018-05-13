//
//  Comunication.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

//the communication class contains all messages to display to users
class Communication {
    
    //MARK:-Characters
    //property that contains details about the soldier.
    let soldier = "\n1.\(Type.soldier.rawValue):\n Points de vie: \(Life.soldier.rawValue)\n Dégats: \(Damages.soldier.rawValue)\n Arme: \(Weapons.soldier.rawValue)\n"
    //property that contains details about the magician
    let magician = "\n2.\(Type.magician.rawValue):\n Points de vie: \(Life.magician.rawValue)\n Dégats: \(Damages.magicianWeapon.rawValue)\n Soin: \(Damages.magicianHealer.rawValue)\n Arme: \(Weapons.magician.rawValue)\n"
    //property that contains details about the colossus
    let colossus = "\n3.\(Type.colossus.rawValue):\n Points de vie: \(Life.colossus.rawValue)\n Dégats: \(Damages.colossus.rawValue)\n Arme: \(Weapons.colossus.rawValue)\n"
    //property that contains details about the gnome
    let gnome = "\n4.\(Type.gnome.rawValue):\n Points de vie: \(Life.gnome.rawValue)\n Dégats: \(Damages.gnome.rawValue)\n Arme: \(Weapons.gnome.rawValue)\n"
    
    // MARK:-Errors
    //property that contains a simple error message
    let errorTerm = "\nErreur valeur incorrecte\n"
    //contains an error message for choosing character names and teams
    let errorNameIsEmpty = "Erreur! veuillez entrer un nom!"
    //contains a unique name error message
    let nameAlreadyExists = "\nCe nom est deja utilisé, veuillez en choisir un autre!\n"
    //contains a error message value without characters
    let noCharacterValue = "Cette valeur ne contient pas de personnage"
    //contains the message value not taken into account
    let ignoreValue = "\n\nErreur! Votre valeur n'a pas été prise en compte. C'est toujours à votre tour"
    //properties used to display a help message when the user enters an incorrect value at some point in the program
    let valueForChoice = "\nEntrer une valeur entre 1 et 3 pour faire un choix"
    
    //MARK:-Help Message
    //contains a help message to inform the user about the game's progress
    let choose3Characters = "Choisissez et nommez 3 personnages chacun votre tour.\n"
    let requestToRestart = "Que voulez-vous faire? \n1.Rejouer! \n2.Quitter!"
    
    //MARK:-Fight
    //contains the message that the fight is ready to be started
    let fightReady = "C'est parti, le combat peut commencer!"
    //contains a help message to choose the attacking character
    let selectedAnAttacker = "\n\nChoisissez le personnage de votre équipe que vous souhaitez utiliser pour l'attaque."
    //contains the message of the magician's choices
    let assaultOrHeal = "que voulez-vous faire? \n1.Attaquer \n2.Soigner un personnage \n3.soigner tous les personnages vivant de votre équipe"
    //property containing a help message that appears when a player enters an unknown value 
    let choiceMagicianErrorValue = "Entrez un chiffre entre 1 et 3 pour faire un choix.\n"
    //contains the message that informs the player that he must choose the enemy to attack
    let selectedAnEnemy = "Choisissez maintenant le personnage adverse a attaquer"
    //contains the message informing the player that he must choose the player to heal
    let selectedCharaToHeal = "Choisissez le personnage de votre équipe que vous voulez soigner"
    //contains the message that informs the player that he has only one character left to heal
    let oneCharacterToHealMultiple = "\nIl ne vous reste plus qu'un seul personnage vivant, tous les soins lui seront attribués"
    //contains the message that informs the player that he has only one character left to heal
    let oneCharacterToHeal = "\nle dernier personnage vivant de votre equipe de votre equipe à été choisi pour le soin"
    
    //MARK:-Sceneries
    //contains a structure to make a message more readable
    let sceneries1 = "=========================================================================================="
    //contains a structure to make a message more readable
    let sceneries2 = "------------------------------------------------------------------------------------------"
    //contains a structure to make a message more readable
    let sceneries3 = "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    //contains a structure to make a message more readable
    let sceneries4 = "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
    //contains 2 line breaks to make messages more readable
    let textSeparation = "\n\n"
    //contains big line breaks to make messages more readable
    let bigTextSeparation = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    
    //MARK:-Chest
    //contains the message that appears when a chest appears
    let chestAppears = "Un coffre de ravitaillement apparait!"
    
    //MARK:-Stats
    //contains the message that appears to notice a player's statistics
    let yourStats = "Voici vos stats:"
    
    //MARK:-Team Composition Func
    //method that displays a message when the team name is requested
    func messageRequestNameTeam(player: Players) {
        print("\nJoueur \(player.playerTeamNumber): Entrez un nom pour votre équipe.\n")
    }
    //method that displays a message once the player has chosen the name of his team
    func messageTeamNameIs(player: Players) {
        if player.name != nil {
            print("\nJoueur \(player.playerTeamNumber), Votre équipe se nomme: \(player.name!)\n")
        }
    }
    //method that displays several help messages when the player has to compose his team
    func helpChooseCharacter(player: Players) {
        //contains a help message which is displayed as long as the player does not have his complete team
        let helpMessageChooseCharacter = "Entrez un chiffre entre 1 et 4 pour choisir un personnage.\n"
        if player.numberTeamCharacters == 0 {
            print("Joueur \(player.playerTeamNumber): Choisissez vos 3 personnages.\n"
                + helpMessageChooseCharacter)
        } else {
            print("Joueur \(player.playerTeamNumber): Vous devez choisir encore \(3 - player.numberTeamCharacters) personnage(s).\n"
                + helpMessageChooseCharacter)
        }
    }
    //contains a message that confirms the player's character choice
    func messageNamedCharacter(character: Type) -> String {
        return "\nVous avez choisi un \(character.rawValue), donnez lui un nom\n"
    }
    //contains a help message that lets you know how many characters are left to choose so that the team is full
    func chooseAgainCharacter(player: Players) {
        print("\nChoisissez encore \(3 - player.numberTeamCharacters) personage(s)")
    }
    //contains a message to inform the player when his team is full
    func teamFull(player: Players) {
        print("\nL'équipe du Joueur \(player.playerTeamNumber) est au complet!\n")
    }
    
    //MARK:-Fight func
    //contains a message that lets you know which player's turn
    func playerTurn(player: Players) {
        print("Joueur \(player.playerTeamNumber) c'est a vous!")
    }
    //is used to display the teams of the 2 players
    func display2team(playerIndex: Players, playerNoIndex: Players) {
        print("\(communication.sceneries2)\n"
            + "\(communication.sceneries4)\n"
            + "\(communication.sceneries2)")

        print(playerIndex.name! + " voici vos personnages:")
        communication.displayTeam(player: playerIndex, index: true)
        
        print("\(communication.sceneries2)\n"
            + "\(communication.sceneries4)\n"
            + "\(communication.sceneries2)")
        
        print("Personnage(s) de l'équipe adverse:")
        communication.displayTeam(player: playerNoIndex, index: false)
        
        print("\(communication.sceneries2)\n"
            + "\(communication.sceneries4)\n"
            + "\(communication.sceneries2)")
    }
    //allows to check the type of the attacker to offer him the available choices
    func verifyTypeAttakers(player: Players, charactereNum: Int) {
        if player.characters[charactereNum].type != .magician {
            print(bigTextSeparation)
            print("Vous allez utiliser \(player.characters[charactereNum].name) pour attaquer l'adversaire\n")
        } else {
            print(bigTextSeparation)
            print("Vous allez utiliser \(player.characters[charactereNum].name) pour attaquer l'adversaire ou effectuer un soin\n")
        }
    }
    //contains a help message when choosing the attacker
    func enterNumberBetween(playerAttacker: Players, playerEnemy: Players, attackers: Bool, enemy: Bool) {
        if attackers == true {
            if playerAttacker.characters.count > 1 {
                print(textSeparation)
                print("Entrez un chiffre entre 1 et \(playerAttacker.characters.count) pour choisir votre attaquant")
                print(textSeparation)
            } else {
                print(textSeparation)
                print("tapez 1 pour choisir le dernier joueur vivant de votre équipe pour l'attaque")
                print(textSeparation)
            }
        }
        if enemy == true {
            if playerEnemy.characters.count > 1 {
                print("Entrez un chiffre entre 1 et \(playerEnemy.characters.count) pour choisir le personnage adverse à attaquer")
            } else {
                print("Tapez 1 pour choisir le dernier personnage vivant de l'équipe adverse.")
            }
        }
    }
    //allows you to display the player's team as a parameter
    func displayTeam(player: Players, index: Bool) {
        //i is equal to the number placed in front of the character details when it is displayed
        var i = 1
        if index == true {
            for character in player.characters {
                if character.healer != nil {
                    print("\n\(i). Nom: \(character.name)\n Type: \(character.type.rawValue)\n Vie: \(character.life)Pv\n Dégats: \(character.weaponDamages)Pv\n soin: \(character.healer!)Pv par Soin")
                } else {
                    print("\n\(i). Nom: \(character.name)\nType: \(character.type.rawValue)\n Vie: \(character.life)Pv\n Dégats: \(character.weaponDamages)Pv\n Soin: Non")
                    //'for test'print(perso.idNumber)
                    //'for test'print(perso.indexPosition)
                }
                i += 1
            }
        } else {
            for perso in player.characters {
                if perso.healer != nil {
                    print("\nNom: \(perso.name)\nType: \(perso.type.rawValue)\nVie: \(perso.life)Pv\nDégats: \(perso.weaponDamages)Pv\nSoin: \(perso.healer!)Pv par Soin")
                } else {
                    print("\nNom: \(perso.name)\nType: \(perso.type.rawValue)\nVie: \(perso.life)Pv\nDégats: \(perso.weaponDamages)Pv\nSoin: NON")
                    //'for test'print(perso.idNumber)
                    //'for test'print(perso.indexPosition)
                }
            }
        }
    }
    //CHEST FUNC
    //method that display a message that details what the character found in the chest
    func discoverWeaponBonusOrMagicianBonus(character: Characters) {
        if character.type != .magician {
            print("En ouvrant le coffre \(character.name) à trouvé un \(character.weapon)\nDégats: \(character.weaponDamages)Pv\n")
            print("\n\(character.name) s'équipe de la nouvelle arme le temps de l'attaque.\n")
        } else {
            print("En ouvrant le coffre \(character.name) a trouvé des \(character.weapon)\nSoin: \(character.healer!)Pv.\n")
            print("\n\(character.name) s'équipe du nouvel equipement le temps de l'attaque.\n")
        }
    }
    //method that displays useful information during an attack
    func attackInformation(playerEnemy: Players, attacker: Characters, enemy: Characters) {
        let infoAssault = "\n\n\n\n\n\(attacker.name) attaque \(enemy.name) et lui enlève \(attacker.weaponDamages)pv"
        let enemyIsDead = "\n\(enemy.name) n'as plus de vie et succombe de ses blessures"
        if enemy.life <= 0 {
            print(infoAssault + enemyIsDead)
            fight.deleteCharacterArray(player: playerEnemy, character: enemy)
            fight.changeIndexPosition(player: playerEnemy)
        } else {
            print(infoAssault)
        }
    }
    //method that displays useful information during a healing process
    func healInformation(player: Players, healer: Characters, characterToHeal: Characters, healMultiple: Bool) {
        if healMultiple == true {
            if healer.name == characterToHeal.name {
                print("\(characterToHeal.name) se soigne et recupère \(healer.healer!/player.characters.count)pv")
            } else {
                print("\(healer.name) soigne \(characterToHeal.name), il recupère \(healer.healer!/player.characters.count)pv")
            }
        } else {
            if healer.name == characterToHeal.name {
                print("\(characterToHeal.name) se soigne et recupère \(healer.healer!)pv")
            } else {
                print("\(healer.name) soigne \(characterToHeal.name), il recupère \(healer.healer!)pv")
            }
        }
    }
    
    //MARK:-Finished game
    //is used to display the winner of the game
    func showTheWinner(player: Players) {
        print("\(player.name!) est vainqueur de la partie!!")
    }
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
