//
//  GameViewController.swift
//  WaffleRun
//
//  Created by Aiello Giovanni on 09/06/2020.
//  Copyright © 2020 HangoverTeam. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         
        let gameScene = GameScene()
        let mainMenu = MainMenu()
        let skView = view as! SKView
        gameScene.scaleMode = .resizeFill
        mainMenu.scaleMode = .resizeFill
        skView.ignoresSiblingOrder = false
        skView.showsFPS = true 
        skView.presentScene(mainMenu)
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
