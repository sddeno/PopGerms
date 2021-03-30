//
//  Bird.swift
//  Birds
//
//  Created by shubham on 09/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit



enum BirdType: String{
    case red, blue, yellow, gray
}


class Bird: SKSpriteNode {

    let birdType: BirdType
    var grabbed = false
    var flying = false {
        didSet{
            if flying{
                physicsBody?.isDynamic = true
                animateFlight(active: true)
            } else{
                animateFlight(active: false)
                
            }
        }
        
    }
    
    let flyingFrames: [SKTexture]
    
    init(type: BirdType){
        birdType = type
        
        flyingFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: type.rawValue), withName: type.rawValue)
        
        let texture = SKTexture(imageNamed: type.rawValue + "1")
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func animateFlight(active: Bool){
        if active{
            run(SKAction.repeatForever(SKAction.animate(with: flyingFrames, timePerFrame: 0.01, resize: true, restore: true)))
        } else {
            removeAllActions()
        }
    }
}


