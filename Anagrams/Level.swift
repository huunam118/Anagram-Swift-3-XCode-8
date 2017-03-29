//
//  Level.swift
//  Anagrams
//
//  Created by NamNH on 3/24/17.
//  Copyright © 2017 Caroline. All rights reserved.
//

import UIKit

struct Level {
    let pointsPerTile: Int
    let timeToSolve: Int
    let anagrams: [NSArray]
    
    init(level: Int) {
        // 1 find .plist file for this level
        let fileName = "level\(level)"
        let fileExts = "plist"
        let levelPath = Bundle.main.path(forResource: fileName, ofType: fileExts)

        // 2 load .plist file
        let levelDictionary: NSDictionary? = NSDictionary(contentsOfFile: levelPath!)
        
        // 3 validation
        assert(levelDictionary != nil, "Level configuration file not found !")
        
        // 4 initialize the object from dictionary
        self.pointsPerTile = levelDictionary!["pointsPerTile"] as! Int
        self.timeToSolve = levelDictionary!["timeToSolve"] as! Int
        self.anagrams = levelDictionary!["anagrams"] as! [NSArray]
    }
}
