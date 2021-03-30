//
//  LevelData.swift
//  Birds
//
//  Created by shubham on 10/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit
import Foundation

struct LevelData {
    let birds: [String]
    
    init?(level: Int){
        //fetching dictionary for exact level
        guard let levelDictionary = Levels.levelsDictionary["Level_\(level)"] as? [String:Any] else{
            return nil
        }
        
        guard let  birds = levelDictionary["Birds"] as? [String] else{
            return nil
        }
        self.birds = birds
    }
}
