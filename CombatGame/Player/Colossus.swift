//
//  Colosse.swift
//  CombatGame
//
//  Created by stephane verardo on 05/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Colossus: Player {
    init(name: String) {
        super.init(name: name, type: PlayerType.colosse, pointOfLife: 120, weapon: Spear())
        
    }
}
