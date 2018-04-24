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
    
    
    
    func messageNamedCharacter(player: Players) {
        //Message display that asks what you want to call your team
        print("Joueur \(player.numberTeamCharacters) comment voulez vous nommer votre équipe ?")
    }
}
