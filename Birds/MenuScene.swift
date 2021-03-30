//
//  MenuScene.swift
//  Birds
//
//  Created by shubham on 10/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        setupMenu()
    }
    
    func setupMenu(){
        let background = SKSpriteNode(imageNamed: "menuBackground")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.aspectScale(to: frame.size, width: true, multiplier: 1.0)
        background.zPosition = ZPosition.background
        addChild(background)
        
        let button = SpriteKitButton(defaultButtonImage: "normalPlayButton", action: goToShopScene, index: 0)
        button.position = CGPoint(x: frame.midX, y: frame.midY * 0.8)
        button.aspectScale(to: frame.size, width: false, multiplier: 0.2)
        button.zPosition = ZPosition.hudLabel
        addChild(button)
  
    }
    
    func goToShopScene(_: Int){
        sceneManagerDelegate?.presentShopScene()
    }

}
