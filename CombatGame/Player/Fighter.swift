//
//  Combattant.swift
//  CombatGame
//
//  Created by stephane verardo on 05/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Fighter: Player {

    init(name: String) {
        super.init(name: name, type: "combattant", pointOfLife: 100, weapon: Sword())
    }
}
