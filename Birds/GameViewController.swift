//
//  GameViewController.swift
//  Birds
//
//  Created by shubham on 09/04/20.
//  Copyright © 2020 Shubham Deshmukh. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


protocol SceneManagerDelegate{
    func presentMenuScene()
    func presentLevelScene()
    func presentPremiumLevelScene()
    func presentGameSceneFor(level: Int)
    func presentPremiumGameSceneFor(level: Int)
    func presentShopScene()
    func purchaseSuperTapped()
}


class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentMenuScene()
    }
}



extension GameViewController : SceneManagerDelegate {
    func presentMenuScene() {
        let menuScene = MenuScene()
        menuScene.sceneManagerDelegate = self
        present(scene: menuScene)
    }
    
    func presentLevelScene() {
        let levelScene = LevelScene()
        levelScene.sceneManagerDelegate = self
        present(scene: levelScene)
    }
    
    //
    func presentPremiumLevelScene() {
        let premiumLevelScene = PremiumLevelScene()
        premiumLevelScene.sceneManagerDelegate = self
        presentPremium(scene: premiumLevelScene)
    }
    
    func presentGameSceneFor(level: Int) {
        let sceneName = "GameScene_\(level)"
        if let gameScene = SKScene(fileNamed: sceneName) as? GameScene {
            gameScene.sceneManagerDelegate = self
            gameScene.level = level
            present(scene: gameScene)
        }
    }
    
    //
    func presentPremiumGameSceneFor(level: Int){
        let premiumSceneName = "PremiumGameScene_\(level)"
        if let premiumGameScene = SKScene(fileNamed: premiumSceneName) as? PremiumGameScene {
            premiumGameScene.sceneManagerDelegate = self
            premiumGameScene.level = level
            presentPremium(scene: premiumGameScene)
        }
    }
    
    func present(scene: SKScene){
        if let view = self.view as! SKView? {
            if let gestureRecoginzers = view.gestureRecognizers {
                for recognizer in gestureRecoginzers {
                    view.removeGestureRecognizer(recognizer)
                }
            }
            scene.scaleMode = .resizeFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
        }
    }
    
    
    func presentPremium(scene: SKScene){
        if let view = self.view as! SKView? {
            if let gestureRecoginzers = view.gestureRecognizers {
                for recognizer in gestureRecoginzers {
                    view.removeGestureRecognizer(recognizer)
                }
            }
            scene.scaleMode = .resizeFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
        }
    }
    
    
    
    
    
    
    func presentShopScene() {
        let shopScene = ShopScene()
        shopScene.sceneManagerDelegate = self
        presentShopScene(scene: shopScene)
        
    }
    
    func presentShopScene(scene: SKScene){
        if let view = self.view as! SKView? {
            if let gestureRecoginzers = view.gestureRecognizers {
                for recognizer in gestureRecoginzers {
                    view.removeGestureRecognizer(recognizer)
                }
            }
            scene.scaleMode = .resizeFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
        }
    }
    
    
    
    func purchaseSuperTapped() {
        RebeloperStore.shared.purchase(.nonConsumable1)
        
    }
    
}
