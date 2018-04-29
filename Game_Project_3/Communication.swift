//
//  Comunication.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Communication {
    
    //MARK:-Characters
    let soldier = "\n1.Combattant:\n Points de vie: 100\n Dégats: 10\n Arme: Épée\n"
    let magician = "\n2.Mage:\n Points de vie: 50\n Dégats: 9\n Soin: 12\n Arme: Dague soignante\n"
    let colossus = "\n3.Colosse:\n Points de vie: 110\n Dégats: 4\n Arme: Poing en fer\n"
    let gnome = "\n4.Nain:\n Points de vie: 14\n Dégats: 21\n Arme: Arbalette\n"
    // MARK:-Errors
    let errorTerm = "\nErreur valeur incorrecte\n"
    let errorNameIsEmpty = "Erreur! veuillez entrer un nom!"
    let nameAlreadyExists = "\nCe nom est deja utilisé, veuillez en choisir un autre!\n"
    let noCharacterValue = "Cette valeur ne contient pas de personnage"
    let ignoreValue = "Erreur! Votre valeur n'a pas été prise en compte. C'est toujours à votre tour"
    //MARK:-Help Message
    let choose3Characters = "Choisissez et nommez 3 personnages chacun votre tour.\n"
    //MARK:-Fight
    let fightReady = "C'est parti, le combat peut commencer!"
    let selectedAnAttacker = "Choisissez le personnage de votre équipe que vous souhaitez utiliser pour l'attaque."
    let selectedAnEnemy = "Choisissez maintenant le personnage adverse a attaquer"
    //MARK:-Sceneries
    let sceneries1 = "=========================================================================================="
    let sceneries2 = "------------------------------------------------------------------------------------------"
    let sceneries3 = "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    let sceneries4 = "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
    let textSeparation = "\n\n"
    let bigTextSeparation = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    
    //MARK:-Team Composition Func
    func messageRequestNameTeam(player: Players) {
        print("\nJoueur \(player.playerTeamNumber): Entrez un nom pour votre équipe.\n")
    }
    func messageTeamNameIs(player: Players) {
        if player.name != nil {
            print("\nJoueur \(player.playerTeamNumber), Votre équipe se nomme: \(player.name!)\n")
        }
    }
    func helpChooseCharacter(player: Players) {
        let helpMessageChooseCharacter = "Entrez un chiffre entre 1 et 4 pour choisir un personnage.\n"
        if player.numberTeamCharacters == 0 {
            print("Joueur \(player.playerTeamNumber): Choisissez vos 3 personnages.\n"
                + helpMessageChooseCharacter)
        } else {
            print("Joueur \(player.playerTeamNumber): Vous devez choisir encore \(3 - player.numberTeamCharacters) personnage(s).\n"
                + helpMessageChooseCharacter)
        }
    }
    func messageNamedCharacter(character: type) -> String {
        return "\nVous avez choisi un \(character.rawValue), donnez lui un nom\n"
    }
    func chooseAgainCharacter(player: Players) {
        print("\nChoisissez encore \(3 - player.numberTeamCharacters) personage(s)")
    }
    func teamFull(player: Players) {
        print("\nL'équipe du Joueur \(player.playerTeamNumber) est au complet!\n")
    }
    //MARK:-Fight func
    func playerTurn(player: Players) {
        print("Joueur \(player.playerTeamNumber) c'est a vous!")
    }
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
    func verifyTypeAttakers(player: Players, charactereNum: Int) {
        if player.characters[charactereNum].type != .magician {
            print(bigTextSeparation)
            print("Vous allez utiliser \(player.characters[charactereNum].name) pour attaquer l'adversaire")
        } else {
            print(bigTextSeparation)
            print("Vous allez utiliser \(player.characters[charactereNum].name) pour attaquer l'adversaire ou effectuer un soin")
        }
    }
    func enterNumberBetween(playerAttacker: Players, playerEnemy: Players, attackers: Bool, enemy: Bool) {
        if attackers == true {
            if playerAttacker.characters.count > 1 {
                print("Entrez un chiffre entre 1 et \(playerAttacker.characters.count) pour choisir votre attaquant")
            } else {
                print("tapez 1 pour choisir le dernier joueur vivant de votre équipe pour l'attaque")
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
    func displayTeam(player: Players, index: Bool) {
        var i = 1
        if index == true {
            for perso in player.characters {
                if perso.healer != nil {
                    print("\n\(i). Nom: \(perso.name)\n Type: \(perso.type.rawValue)\n Vie: \(perso.life)Pv\n Dégats: \(perso.weaponDamages.rawValue)Pv\n soin: \(perso.healer!)Pv par Soin")
                } else {
                    print("\n\(i). Nom: \(perso.name)\nType: \(perso.type.rawValue)\n Vie: \(perso.life)Pv\n Dégats: \(perso.weaponDamages.rawValue)Pv\n Soin: Non")
                    //'for test'print(perso.idNumber)
                    //'for test'print(perso.indexPosition)
                }
                i += 1
            }
        } else {
            for perso in player.characters {
                if perso.healer != nil {
                    print("\nNom: \(perso.name)\nType: \(perso.type.rawValue)\nVie: \(perso.life)Pv\nDégats: \(perso.weaponDamages.rawValue)Pv\nSoin: \(perso.healer!)Pv par Soin")
                } else {
                    print("\nNom: \(perso.name)\nType: \(perso.type.rawValue)\nVie: \(perso.life)Pv\nDégats: \(perso.weaponDamages.rawValue)Pv\nSoin: NON")
                    //'for test'print(perso.idNumber)
                    //'for test'print(perso.indexPosition)
                }
            }
        }
    }
    func attackInformation(playerEnemy: Players, attacker: Characters, enemy: Characters) {
        let livingEnemy = "\n\n\n\n\n\(attacker.name) attaque \(enemy.name) et lui enlève \(attacker.weaponDamages.rawValue)pv"
        let enemyIsDead = "\n\(enemy.name) n'as plus de vie et succombe de ses blessures"
        if enemy.life <= 0 {
            print(livingEnemy + enemyIsDead)
            fight.deleteCharacterArray(player: playerEnemy, character: enemy)
            fight.changeIndexPosition(player: playerEnemy)
        } else {
            print(livingEnemy)
        }
    }
    //Finished game
    func showTheWinner(player: Players) {
        print("L'équipe qui sort vainqueur de la partie est : \(player.name!) !!")
    }
}
