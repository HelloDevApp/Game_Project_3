//
//  Comunication.swift
//  Game_Project_3
//
//  Created by Mac Book Pro on 24/04/2018.
//  Copyright © 2018 dylan. All rights reserved.
//

import Foundation

class Communication {
    //ERRORS
    let errorNameIsEmpty = "Erreur! veuillez entrer un nom!"
    //ALERT
    let choose3Characters = "Choisissez et nommez 3 personnages chacun votre tour"
    
    func messageRequestNameTeam(player: Players) {
        print("Joueur \(player.playerTeamNumber): Entrer un nom pour votre équipe.\n")
    }
    func teamNameIs(player: Players) {
        if player.name != nil {
            print("\nJoueur \(player.playerTeamNumber), Votre équipe se nomme: \(player.name!)")
        }
    }
    func messageNamedCharacter(character: Characters) {
        print("Vous avez choisi un \(character.type.rawValue) comment voulez vous le nommer?")
    }
}
