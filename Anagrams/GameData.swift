//
//  GameData.swift
//  Anagrams
//
//  Created by NamNH on 3/24/17.
//  Copyright © 2017 Caroline. All rights reserved.
//

import Foundation

class GameData {
    var points: Int = 0 {
        didSet {
            points = max(points, 0)
        }
    }
}
