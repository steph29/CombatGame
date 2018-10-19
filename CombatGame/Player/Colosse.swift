//
//  Colosse.swift
//  CombatGame
//
//  Created by stephane verardo on 05/10/2018.
//  Copyright © 2018 stephane verardo. All rights reserved.
//

import Foundation

class Colosse: Player {
  init(name: String) {
    super.init(name: name, type: "colosse", pointOfLife: 20, weapon: Lance())
        
    }
}
