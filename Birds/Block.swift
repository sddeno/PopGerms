//
//  Block.swift
//  Birds
//
//  Created by shubham on 10/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit

enum BlockType: String{
    case wood, stone, glass, prop1, darkWood, premiumGlass
}

class Block: SKSpriteNode {
    
    let type: BlockType
    var health: Int
    let damageThreashold: Int
    
    init(type: BlockType){
        self.type = type
        switch type {
        case .wood:
            health = 100
        case .stone:
            health = 200
        case .glass:
            health = 100
        case .prop1:
            health = 100
        case .darkWood:
            health = 200
        case .premiumGlass:
            health = 100
     
        }
        
        damageThreashold = health/2
        let texture = SKTexture(imageNamed: type.rawValue)
        super.init(texture:texture, color: UIColor.clear, size:CGSize.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createPhysicsBody(){
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.block
        physicsBody?.contactTestBitMask = PhysicsCategory.all
        physicsBody?.collisionBitMask = PhysicsCategory.all
    }
    
    
    func impact(with force: Int){
        health -= force
        print(health)
        
        if health < 1{
            removeFromParent()
        } else if health < damageThreashold {
            color = UIColor.red
            let brokenTexture = SKTexture(imageNamed: type.rawValue + "Broken")
            texture = brokenTexture
        }
    }
}
