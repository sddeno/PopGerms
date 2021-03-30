
//
//  PremiumLevelScene.swift
//  Birds
//
//  Created by shubham on 12/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit

class PremiumLevelScene: SKScene {
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        setupPremiumLevelSelection()
    }
    
    func setupPremiumLevelSelection(){
        let background = SKSpriteNode(imageNamed: "levelBackground")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.aspectScale(to: frame.size, width: true, multiplier: 1.0)
        background.zPosition = -1
        addChild(background)
        
        let backButton = SpriteKitButton(defaultButtonImage: "backButton", action: goBack, index: 0)
        backButton.position = CGPoint(x: frame.midX/8, y: frame.midY + (frame.midY/4) * 3)
        backButton.aspectScale(to: frame.size, width: true, multiplier: 0.05)
        backButton.zPosition = ZPosition.hudBackground
        addChild(backButton)
        
        var level = 10
        let columnStartingPoint = frame.midX/2
        let rowStartingPoint = frame.midY + frame.midY/2
        
        for row in 0..<3 {
            for column in 0..<3 {
                let levelBoxButton = SpriteKitButton(defaultButtonImage: "woodButton", action: goToGameSceneFor, index: level)
                levelBoxButton.position = CGPoint(x: columnStartingPoint + CGFloat(column) * columnStartingPoint, y: rowStartingPoint - CGFloat(row) * frame.midY/2)
                levelBoxButton.zPosition = ZPosition.hudBackground
                addChild(levelBoxButton)
                
                
                let levelLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
                levelLabel.fontSize = 150.0
                levelLabel.verticalAlignmentMode = .center
                levelLabel.text = "\(level)"
                levelLabel.fontColor = UIColor.lightText
                levelLabel.aspectScale(to: levelBoxButton.size, width: false, multiplier: 0.5)
                levelLabel.zPosition = ZPosition.hudLabel
                levelBoxButton.addChild(levelLabel)
                levelBoxButton.aspectScale(to: frame.size, width: false, multiplier: 0.2)
                
                level += 1
                
                
            }
        }
        
        
    }
    
    func goToGameSceneFor(level: Int){
        sceneManagerDelegate?.presentPremiumGameSceneFor(level: level)
    }
    
    func goBack(_: Int){
           sceneManagerDelegate?.presentShopScene()
       }

}
