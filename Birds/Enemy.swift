//
//  Enemy.swift
//  Birds
//
//  Created by shubham on 10/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit

enum EnemyType: String{
    case orange, redduck, redbob, virusa, virusb, penemy, pinkenemy
}

class Enemy: SKSpriteNode {

    let type: EnemyType
    var  health: Int
    let animationFrames: [SKTexture]
    
    init(type: EnemyType){
        self.type = type
        animationFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: type.rawValue), withName:type.rawValue)
        switch type{
        case .orange:
            health = 100
        case .redduck:
            health = 100
        case .redbob:
            health = 450
        case .virusa:
            health = 200
        case .virusb:
            health = 200
        case .penemy:
            health = 100
        case .pinkenemy:
            health = 200
        }
        let texture = SKTexture(imageNamed: type.rawValue + "1")
        super.init(texture: texture, color: UIColor.clear, size: CGSize.zero)
        animateEnemy()
    }

    func animateEnemy(){
        run(SKAction.repeatForever(SKAction.animate(with: animationFrames, timePerFrame: 0.1, resize: false, restore: true)))
    }
    
    func createPhysicBody(){
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.enemy
        physicsBody?.contactTestBitMask = PhysicsCategory.all
        physicsBody?.collisionBitMask = PhysicsCategory.all
        
    }
    
    func impact(with force: Int) -> Bool{
        health -= force
        if health < 1 {
            removeFromParent()
            return true
        }
        return false
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
