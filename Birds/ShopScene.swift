//
//  shopScene.swift
//  Birds
//
//  Created by shubham on 14/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import SpriteKit

class ShopScene: SKScene {
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        
        setupShopScene()
        nonConsumable1Info()

        NotificationCenter.default.addObserver(forName: NSNotification.Name(iAPStatusChanged),object: nil, queue: OperationQueue.main) { (note) -> Void in
            self.updateUI()
        }
        updateUI()
    }
    
    
    
    func nonConsumable1Info(){
        RebeloperStore.shared.getInfo(.nonConsumable1) { (result) in
            let descriptionString = result.localizedDescription
            print("Descripton : ", descriptionString)
            let priceString = result.localizedPrice
            print("Price of Super Level : ",priceString!)
        }
    }
    
    
    func updateUI(){
        
        if RebeloperStore.shared.isRegularPurchaseBought(.nonConsumable1) {
            
            let actualPremiumButton = SpriteKitButton(defaultButtonImage: "playButton", action: goToPremiumLevelScene, index: 0)
            actualPremiumButton.isUserInteractionEnabled = true // ture once purchased
            actualPremiumButton.position = CGPoint(x: frame.midX + (frame.midX / 2), y: frame.midY)
            actualPremiumButton.anchorPoint = CGPoint(x: actualPremiumButton.size.width/2, y: actualPremiumButton.size.height/2)
            actualPremiumButton.aspectScale(to: frame.size, width: false, multiplier: 0.2)
            actualPremiumButton.zPosition = ZPosition.hudLabel
            addChild(actualPremiumButton)
            print("Super Level Bought and updating UI")
            
            let unlocked = SpriteKitButton(defaultButtonImage: "unlockedButton", action: goToPremiumLevelScene , index: 0)
            unlocked.isUserInteractionEnabled = true
            unlocked.position = CGPoint(x: actualPremiumButton.anchorPoint.x, y: actualPremiumButton.anchorPoint.y)
            unlocked.anchorPoint =  CGPoint.zero
            unlocked.zPosition = ZPosition.hudLabel + 1
            actualPremiumButton.addChild(unlocked)
            
            for child in self.children{
                print("children :",child)
                if child.name == "dummyPremiumButton"{
                    child.removeFromParent()
                    child.removeAllChildren()
                }
            }
            
        } else {
            
            print("Super level not yet Purchased")
            let dummyPremiumButton = SpriteKitButton(defaultButtonImage: "playButton", action: goToDummyPremiumLevelScene, index: 0)
            dummyPremiumButton.isUserInteractionEnabled = true
            dummyPremiumButton.name = "dummyPremiumButton"
            dummyPremiumButton.anchorPoint = CGPoint(x: dummyPremiumButton.size.width/2, y: dummyPremiumButton.size.height/2)
            dummyPremiumButton.position = CGPoint(x: frame.midX + (frame.midX / 2), y: frame.midY)
            dummyPremiumButton.aspectScale(to: frame.size, width: false, multiplier: 0.2)
            dummyPremiumButton.zPosition = ZPosition.hudLabel
            addChild(dummyPremiumButton)
            
            let locked = SpriteKitButton(defaultButtonImage: "lockedButton", action: goToDummyPremiumLevelScene, index: 0)
            locked.isUserInteractionEnabled = true
            locked.name = "locked"
            locked.position = CGPoint(x: dummyPremiumButton.anchorPoint.x, y: dummyPremiumButton.anchorPoint.y)
            locked.anchorPoint =  CGPoint.zero
            locked.zPosition = ZPosition.hudLabel + 1
            dummyPremiumButton.addChild(locked)
            
        }
    }
    
    func setupShopScene(){
        
        let background = SKSpriteNode(imageNamed: "levelBackgroundWithHz")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.alpha = 00.8
        background.aspectScale(to: frame.size, width: true, multiplier: 1.0)
        background.zPosition = ZPosition.background
        addChild(background)
        
        let backButton = SpriteKitButton(defaultButtonImage: "backButton", action: goBack, index: 0)
        backButton.position = CGPoint(x: frame.midX/8, y: frame.midY + (frame.midY/4) * 3)
        backButton.aspectScale(to: frame.size, width: true, multiplier: 0.05)
        backButton.zPosition = ZPosition.hudBackground
        addChild(backButton)
        
        
        let level1Label = SKLabelNode()
        level1Label.text = "Level: Normal"
        level1Label.fontSize = 20
        level1Label.aspectScale(to: frame.size, width: true, multiplier: 0.2)
        level1Label.fontColor = UIColor.systemGray4
        level1Label.fontName = "Arial"
        level1Label.position = CGPoint(x: frame.midX - (frame.midX / 2), y: frame.midY + (frame.midY/2 - frame.midY/8))
        level1Label.zPosition = ZPosition.hudLabel
        addChild(level1Label)
        
        let level2Label = SKLabelNode()
        level2Label.text = "Level: Super"
        level2Label.fontSize = 20
        level2Label.aspectScale(to: frame.size, width: true, multiplier: 0.2)
        level2Label.fontColor = UIColor.systemPink
        level2Label.fontName = "Arial"
        level2Label.position = CGPoint(x: frame.midX + (frame.midX / 2), y: frame.midY + (frame.midY/2 - frame.midY/8))
        level2Label.zPosition = ZPosition.hudLabel
        addChild(level2Label)
        
        
        
        
        let button = SpriteKitButton(defaultButtonImage: "normalPlayButton", action: goToLevelScene, index: 0)
        button.position = CGPoint(x: frame.midX - (frame.midX / 2), y: frame.midY)
        button.aspectScale(to: frame.size, width: false, multiplier: 0.2)
        button.zPosition = ZPosition.hudLabel
        addChild(button)
        
        let normalPlayLable = SKLabelNode()
        normalPlayLable.text = "Play"
        normalPlayLable.fontSize = 20
        normalPlayLable.aspectScale(to: frame.size, width: true, multiplier: 0.06)
        normalPlayLable.fontColor = UIColor.systemGray4
        normalPlayLable.fontName = "Arial"
        normalPlayLable.position = CGPoint(x: frame.midX - (frame.midX / 2), y: frame.midY - (frame.midY/2 - frame.midY/5))
        normalPlayLable.zPosition = ZPosition.hudLabel
        addChild(normalPlayLable)
    
        
        
        
        let premiumPlayLabel = SKLabelNode()
        premiumPlayLabel.text = "Play"
        premiumPlayLabel.fontSize = 20
        premiumPlayLabel.fontColor = UIColor.systemPink
        premiumPlayLabel.fontName = "Arial"
        premiumPlayLabel.aspectScale(to: frame.size, width: true, multiplier: 0.06)
        premiumPlayLabel.position = CGPoint(x: frame.midX + (frame.midX / 2), y: frame.midY - (frame.midY/2 - frame.midY/5))
        premiumPlayLabel.zPosition = ZPosition.hudLabel
        addChild(premiumPlayLabel)
        
        
        let purchaseLabel = SKLabelNode()
        purchaseLabel.text = "\"Unlock Super Level\""
        purchaseLabel.fontSize = 17
        purchaseLabel.aspectScale(to: frame.size, width: true, multiplier: 0.2)
        purchaseLabel.fontColor = UIColor.systemGray6
        purchaseLabel.fontName = "Arial"
        purchaseLabel.position = CGPoint(x: frame.midX + (frame.midX / 2), y: frame.midY - (frame.midY/2))
        purchaseLabel.zPosition = ZPosition.hudLabel
        addChild(purchaseLabel)
        
        let purchaseButton = SpriteKitButton(defaultButtonImage: "buySuperLevel", action: purchaseButtonTapped, index: 0)
        purchaseButton.position = CGPoint(x: frame.midX + (frame.midX / 2), y: frame.midY - (frame.midY/2 + frame.midY/8))
        purchaseButton.aspectScale(to: frame.size, width: true, multiplier: 0.2)
        purchaseButton.zPosition = ZPosition.hudLabel
        addChild(purchaseButton)
        
        
        let restoreButton = SpriteKitButton(defaultButtonImage: "restore", action: restoreButtonTapped, index: 0)
        restoreButton.anchorPoint = CGPoint.zero
        restoreButton.position =  CGPoint(x: frame.size.width - (frame.midX/8), y: frame.midY + (frame.midY/4) * 3)
        restoreButton.aspectScale(to: frame.size, width: true, multiplier: 0.8)
        restoreButton.zPosition = ZPosition.hudLabel
        addChild(restoreButton)
        
    }
    
    
    func goToLevelScene(_: Int){
        sceneManagerDelegate?.presentLevelScene()
    }
    
    func goToPremiumLevelScene(_ : Int){
        sceneManagerDelegate?.presentPremiumLevelScene()
    }
    
    func goToDummyPremiumLevelScene(_:Int){
        print("dummy button Tapped")
    }
    
    func goBack(_: Int){
        sceneManagerDelegate?.presentMenuScene()
    }
    
    
    func purchaseButtonTapped(_:Int){
        sceneManagerDelegate?.purchaseSuperTapped()
    }
    
    func restoreButtonTapped(_:Int){
        RebeloperStore.shared.restorePurchases()
    }
    
    
}
