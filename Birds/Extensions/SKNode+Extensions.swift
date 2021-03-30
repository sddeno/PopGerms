//
//  SKNode+Extensions.swift
//  Birds
//
//  Created by shubham on 10/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit

extension SKNode{
    
    func aspectScale(to size: CGSize, width: Bool, multiplier: CGFloat) {
        let scale = width ? (size.width * multiplier) / self.frame.size.width : (size.height * multiplier) / self.frame.size.height
        self.setScale(scale)
    }
}

