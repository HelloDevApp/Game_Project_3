//
//  Comunication.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Communication {
    
    //CHARACTERS
    let soldierTerm = "Combattant"
    let magicianTerm = "Mage"
    let ColossusTerm = "Colosse"
    let GnomeTerm = "Nain"
    let soldierFull = "\n1.Combattant:\n Points de vie: 100\n Dégats: 10\n Arme: Épée\n"
    let magicianFull = "\n2.Mage:\n Points de vie: 50\n Dégats: 9\n Soin: 12\n Arme: Dague soignante\n"
    let colossusFull = "\n3.Colosse:\n Points de vie: 110\n Dégats: 4\n Arme: Poing en fer\n"
    let gnomeFull = "\n4.Nain:\n Points de vie: 14\n Dégats: 21\n Arme: Arbalette\n"
    //ERRORS
    let errorTerm = "Erreur valeur incorrecte"
    let errorNameIsEmpty = "Erreur! veuillez entrer un nom!"
    let nameAlreadyExists = "Ce nom est deja utiliser, veuillez en choisir un autre!"
    //ALERT
    let playerChooseCharacter = "Choisissez vos 3 personnages."
    let choose3Characters = "Choisissez et nommez 3 personnages chacun votre tour.\n"
    let helpChooseCharacter = "Entrez un chiffre entre 1 et 4 pour choisir un personnage."
    func messageRequestNameTeam(player: Players) {
        print("Joueur \(player.playerTeamNumber): Entrer un nom pour votre équipe.\n")
    }
    func messageTeamNameIs(player: Players) {
        if player.name != nil {
            print("\nJoueur \(player.playerTeamNumber), Votre équipe se nomme: \(player.name!)\n")
        } else {
            print(errorTerm)
        }
    }
    func messageNamedCharacter(character: type) -> String {
        return "\nVous avez choisi un \(character), donnez lui un nom\n"
    }
    func messageChooseCharacter(player: Players) -> String {
        return "Joueur\(player.playerTeamNumber) \(playerChooseCharacter)"
    }
    func chooseAgainCharacter(player: Players) {
        print("\nChoisissez encore \(3 - player.numberTeamCharacters) personages")
    }
}
