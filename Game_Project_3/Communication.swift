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
    let nameAlreadyExists = "\nCe nom est deja utiliser, veuillez en choisir un autre!\n"
    //MARK:-Alert
    let choose3Characters = "Choisissez et nommez 3 personnages chacun votre tour.\n"
    let fightReady = "C'est parti, le combat peut commencer!"
    //MARK:-Fight
    let selectedAnAttacker = "Choisissez quel personnage de votre équipe vous voulez utiliser pour l'attaque."
    //MARK:-Sceneries
    let sceneries1 = "=========================================================================================="
    let sceneries2 = "------------------------------------------------------------------------------------------"
    let sceneries3 = "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    let sceneries4 = "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
    let textSeparation = "\n\n"
    //MARK:-Team composition func
    func messageRequestNameTeam(player: Players) {
        print("\nJoueur \(player.playerTeamNumber): Entrer un nom pour votre équipe.\n")
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
            print("Joueur \(player.playerTeamNumber): Vous devez choisir encore \(3 - player.numberTeamCharacters) personnages.\n"
                + helpMessageChooseCharacter)
        }
    }
    func messageNamedCharacter(character: type) -> String {
        return "\nVous avez choisi un \(character.rawValue), donnez lui un nom\n"
    }
    func chooseAgainCharacter(player: Players) {
        print("\nChoisissez encore \(3 - player.numberTeamCharacters) personages")
    }
    func teamFull(player: Players) {
        print("\nL'équipe du Joueur \(player.playerTeamNumber) est au complet!")
    }
    
    //MARK:-Fight func
    func playerTurn(player: Players) {
        print("Joueur \(player.playerTeamNumber) c'est a vous!")
    }
}
