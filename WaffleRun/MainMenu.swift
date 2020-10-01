//
//  MainMenu.swift
//  WaffleRun
//
//  Created by Aiello Giovanni on 09/06/2020.
//  Copyright © 2020 HangoverTeam. All rights reserved.
//

import Foundation
import SpriteKit


class MainMenu : SKScene {
    
    let mainBG1 = SKSpriteNode(imageNamed: "mainmenu-background0")
    let mainBG2 = SKSpriteNode(imageNamed: "mainmenu-background1")
    let playButton = SKSpriteNode(imageNamed: "play-button-menu")
    
    let screenSize = UIScreen.main.bounds
    
    override func sceneDidLoad() {
        
        /* Background Settings */
        
        mainBG1.position = CGPoint(screenSize: screenSize)
        mainBG1.size = CGSize(screenSize: screenSize)
        
        mainBG2.position = CGPoint(screenSize: screenSize)
        mainBG2.size = CGSize(screenSize: screenSize)
        
        playButton.position = CGPoint(playButtonScreen: screenSize)
        playButton.size = CGSize(playButtonSize: screenSize)
        
        /* End */
        
        
    
        
        addChild(mainBG1)
        addChild(playButton)
        addChild(mainBG2)
        
    }
    
    override func didMove(to view: SKView) {
        
       
        
    }
    
    
    
}
