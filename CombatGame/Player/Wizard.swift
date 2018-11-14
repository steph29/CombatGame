//
//  Mage.swift
//  CombatGame
//
//  Created by stephane verardo on 05/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Wizard: Player {
    init(name: String) {
        super.init(name: name, type: PlayerType.mage, pointOfLife: 80, weapon: Scepter())
    }
    // function to be treat by the wizard
    public func Resurrect(player: Player, care: Int) {
        player.pointOfLife = player.pointOfLife + care
        print ("Vous venez de recupérer \(care). Vous avez désormais \(player.pointOfLife) de points de vie.")
    }
}
