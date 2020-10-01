//
//  GameScene.swift
//  Waffle_Game
//
//  Created by Aiello Giovanni on 30/03/2020.
//  Copyright © 2020 HangoverTeam. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    let screenSize : CGRect = UIScreen.main.bounds  //Size of the screen
    
    let player = Player(numberT: 14, imageName: "3hp-frame")
    
    var center_test = SKShapeNode(circleOfRadius: 10) //Center of the screen
    var center_Camera = SKShapeNode(circleOfRadius: 10)
    var jumpTrigger : Bool = true
    var positionSpeed : CGFloat = 3
    var positionObstacle : Double = 5
    
    
    var cameraNode = SKCameraNode()
    
    let background_0_1 = SKSpriteNode(imageNamed: "background0") //Invisible BG (Where the player leans)
    let background_0_2 = SKSpriteNode(imageNamed: "background0") //Invisible BG (Where the player leans)
    let background_0_3 = SKSpriteNode(imageNamed: "background0") //Invisible BG (Where the player leans)
    let background_1 = SKSpriteNode(imageNamed: "background1-1") //Background 1
    let background_2 = SKSpriteNode(imageNamed: "background1-2") //Background 2
    let background_3 = SKSpriteNode(imageNamed: "background1-3") //Background 3
    var parallax_bg_1 = [SKSpriteNode()] //Parallax Background 1
    var parallax_bg_2 = [SKSpriteNode()] //Parallax Background 2
    var parallax_bg_3 = [SKSpriteNode()] //Parallax Background 3
    var parallax_bg_4 = [SKSpriteNode()] //Parallax Background 4
    var parallax_bg_5 = [SKSpriteNode()] //Parallax Background 5
    let jumpResizeSound = SKAction.playSoundFileNamed("SuonoJump&Resize", waitForCompletion: false) //Jump&Resize Sound
    let damageSound = SKAction.playSoundFileNamed("Dannov2", waitForCompletion: false)
    var obstacle  = Obstacle(source: "ob1") //Obstacle
    var obstacle_2 = Obstacle(source: "ob4") //Obstacle 2
    let HUD = SKSpriteNode(imageNamed: "HUD vettoriale") //HUD
    var score = SKLabelNode() //Label for Score
    var numbScore = 0 {
        didSet {
            score.text = "Score: \(numbScore)"
        }
    }
    var numbObstacle = 0 //Effective Ostacle
    let background_gameOver = SKSpriteNode(imageNamed: "background-pausa")
    let restartButton = SKSpriteNode(imageNamed: "button-resume")
    let quitButton = SKSpriteNode(imageNamed: "button-quit")
    let back_bg1 = SKSpriteNode(imageNamed: "background0-1")
    let back_bg2 = SKSpriteNode(imageNamed: "background1-1")
    let back_bg3 = SKSpriteNode(imageNamed: "background2-1")
    let back_bg4 = SKSpriteNode(imageNamed: "background3-1")
    let back_bg5 = SKSpriteNode(imageNamed: "background4-1")
    let back_bg6 = SKSpriteNode(imageNamed: "background5-1")
    
    var constraint = SKConstraint()
    
    override func sceneDidLoad() {
        
        
        
        physicsWorld.contactDelegate = self //Physics Delegate
        
        
        /* Obstacle Settings*/
        obstacle.position.x = 1000
        obstacle_2.position.x = 2000
        obstacle_2.position.y = background_0_1.frame.maxY
        /* End */
        
        
        /* HUD Settings*/
        HUD.size = CGSize(screenSize: screenSize)
        HUD.position = CGPoint(screenSize: screenSize)
        background_gameOver.size = CGSize(screenSize: screenSize)
        restartButton.size = CGSize(sizeButtonRestart: screenSize)
        restartButton.name = "Restart"
        quitButton.size =  CGSize(sizeButtonQuit: screenSize)
        quitButton.name = "Quit"
        restartButton.zPosition = 5
        quitButton.zPosition = 5
        HUD.zPosition = 5
        score.zPosition = 5
        score.fontSize = CGFloat.returnFontSize(screenSize: screenSize)
        score.fontName = "SanFranciscoDisplay-Bold"
        
        /* End */
        
        
        
        
        
        /* Background Settings */
        background_0_1.name = "ground"
        background_0_1.position = CGPoint(x: screenSize.width/2, y: screenSize.minY)
        background_0_1.size = CGSize(width: screenSize.width, height: getSizeBg(screenSize: screenSize))
        background_0_1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: background_0_1.size.width, height: background_0_1.size.height))
        background_0_1.physicsBody?.affectedByGravity = false
        background_0_1.physicsBody?.isDynamic = false
        background_0_1.physicsBody?.categoryBitMask = 0b0010  //0001
        background_0_1.physicsBody?.collisionBitMask = 0b0001 // 0010
        background_0_1.physicsBody?.contactTestBitMask = 0b0001 // 0001
        
        background_0_2.name = "ground"
        background_0_2.position = CGPoint(x: screenSize.width/2+screenSize.width, y: screenSize.minY)
        background_0_2.size = CGSize(width: screenSize.width, height: getSizeBg(screenSize: screenSize))
        background_0_2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: background_0_1.size.width, height: background_0_1.size.height))
        background_0_2.physicsBody?.affectedByGravity = false
        background_0_2.physicsBody?.isDynamic = false
        background_0_2.physicsBody?.categoryBitMask = 0b0010  //0001
        background_0_2.physicsBody?.collisionBitMask = 0b0001 // 0010
        background_0_2.physicsBody?.contactTestBitMask = 0b0001 // 0001
        
        background_0_3.name = "ground"
        background_0_3.position = CGPoint(x: background_0_2.frame.maxX+screenSize.width/2, y: screenSize.minY)
        background_0_3.size = CGSize(width: screenSize.width, height: getSizeBg(screenSize: screenSize))
        background_0_3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: background_0_1.size.width, height: background_0_1.size.height))
        background_0_3.physicsBody?.affectedByGravity = false
        background_0_3.physicsBody?.isDynamic = false
        background_0_3.physicsBody?.categoryBitMask = 0b0010  //0001
        background_0_3.physicsBody?.collisionBitMask = 0b0001 // 0010
        background_0_3.physicsBody?.contactTestBitMask = 0b0001 // 0001
        
        
        background_1.size = CGSize(screenSize: screenSize)
        background_1.position = CGPoint(screenSize: screenSize)
        
        background_2.size = CGSize(screenSize: screenSize)
        background_2.position = CGPoint(x: background_1.size.width+background_1.size.width/2, y: screenSize.height/2)
        
        background_3.size = CGSize(screenSize: screenSize)
        background_3.position = CGPoint(x: background_2.frame.maxX+background_2.size.width/2, y: screenSize.height/2)
        
        back_bg1.size = CGSize (screenSize: screenSize)
        back_bg2.size = CGSize (screenSize: screenSize)
        back_bg3.size = CGSize (screenSize: screenSize)
        back_bg4.size = CGSize (screenSize: screenSize)
        back_bg5.size = CGSize (screenSize: screenSize)
        back_bg6.size = CGSize (screenSize: screenSize)
        
        back_bg1.position.x =  background_1.position.x-screenSize.width/2
        back_bg1.position.y = background_1.position.y + screenSize.height/2
        
        back_bg2.position.x = background_1.position.x-screenSize.width/2
        back_bg2.position.y = background_1.position.y + screenSize.height/2
        
        back_bg3.position.x = background_1.position.x-screenSize.width/2
        back_bg3.position.y = background_1.position.y + screenSize.height/2
        
        back_bg4.position.x = background_1.position.x-screenSize.width/2
        back_bg4.position.y = background_1.position.y + screenSize.height/2
        
        back_bg5.position.x = background_1.position.x-screenSize.width/2
        back_bg5.position.y = background_1.position.y + screenSize.height/2
        
        back_bg5.position.x = background_1.position.x-screenSize.width/2
        back_bg5.position.y = background_1.position.y + screenSize.height/2
        
        back_bg6.position.x = background_1.position.x-screenSize.width/2
        back_bg6.position.y = background_1.position.y + screenSize.height/2
        
        /* End */
        
        
        
        
        /* Camera Settings*/
        
        cameraNode.position.y = background_1.position.y
        camera = cameraNode
        /* End */
        
        addMultipleChild()
    }
    
    override func didMove(to view: SKView) {
        
        run(SKAction.repeat(SKAction.sequence([SKAction.wait(forDuration: 10),SKAction.run {
            self.positionSpeed += 1
            }]),count: 10))
        
        /* Player Setting*/
        player.position = CGPoint(x: 0, y: 100)
        player.name = "Player"
        player.run(player.endlessRunAnimation())
        player.zPosition = 1
        /* End */
        
        
      
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        print(positionSpeed)
        /* HUD Setting */
        if (player.life > 0) {
            HUD.position = cameraNode.position
            numbScore += 1
            score.position.x = cameraNode.position.x+getScorePositionX(screenSize: screenSize)
            score.position.y = cameraNode.position.y+getScorePositionY(screenSize: screenSize)
        }
        /* End */
        
        /* Camera Setting*/
        cameraNode.position.x = player.position.x+getCameraPosition(screenSize: screenSize)
        /* End */
        
        /* Player setting*/
        if(player.life > 0) {
            player.position.x += positionSpeed
        }
            /* End */
        
        /* Endless Background Settings */
        if (cameraNode.position.x > background_1.position.x+100) {
            background_3.position = CGPoint(x: background_2.frame.maxX+background_2.size.width/2, y: screenSize.height/2)
            background_0_3.position = CGPoint(x: background_0_2.frame.maxX+screenSize.width/2, y: screenSize.minY)
            parallax_bg_1[2].position = background_3.position
            parallax_bg_2[2].position = background_3.position
            parallax_bg_3[2].position = background_3.position
            parallax_bg_4[2].position = background_3.position
            parallax_bg_5[2].position = background_3.position
            
        }
        if (cameraNode.position.x > background_2.position.x+100) {
            background_1.position = CGPoint(x: background_3.frame.maxX+background_2.size.width/2, y: screenSize.height/2)
            background_0_1.position = CGPoint(x: background_0_3.frame.maxX+screenSize.width/2, y: screenSize.minY)
            parallax_bg_1[0].position = background_1.position
            parallax_bg_2[0].position = background_1.position
            parallax_bg_3[0].position = background_1.position
            parallax_bg_4[0].position = background_1.position
            parallax_bg_5[0].position = background_1.position
            
        }
        if (cameraNode.position.x > background_3.position.x+100) {
            background_2.position = CGPoint(x: background_1.frame.maxX+background_1.size.width/2, y: screenSize.height/2)
            background_0_2.position = CGPoint(x: background_0_1.frame.maxX+screenSize.width/2, y: screenSize.minY)
            parallax_bg_1[1].position = background_2.position
            parallax_bg_2[1].position = background_2.position
            parallax_bg_3[1].position = background_2.position
            parallax_bg_4[1].position = background_2.position
            parallax_bg_5[1].position = background_2.position
        }
        
        /* End */
        
        /*Remove From Parent Settings */
        enumerateChildNodes(withName: "ob1") {
            node, stop in
            let Enemy = node as! SKSpriteNode
            
            if (Enemy.position.x < self.cameraNode.position.x-self.screenSize.width/2) {
                
                Enemy.removeFromParent()
            }
        }
        enumerateChildNodes(withName: "ob2") {
            node, stop in
            let Enemy = node as! SKSpriteNode
            
            if (Enemy.position.x < self.cameraNode.position.x-self.screenSize.width/2) {
                
                Enemy.removeFromParent()
            }
        }
        enumerateChildNodes(withName: "ob3") {
            node, stop in
            let Enemy = node as! SKSpriteNode
            
            if (Enemy.position.x < self.cameraNode.position.x-self.screenSize.width/2) {
                
                Enemy.removeFromParent()
            }
        }
        enumerateChildNodes(withName: "ob4") {
            node, stop in
            let Enemy = node as! SKSpriteNode
            
            if (Enemy.position.x < self.cameraNode.position.x-self.screenSize.width/2) {
                
                Enemy.removeFromParent()
            }
        }
        enumerateChildNodes(withName: "ob5") {
            node, stop in
            let Enemy = node as! SKSpriteNode
            
            if (Enemy.position.x < self.cameraNode.position.x-self.screenSize.width/2) {
                
                Enemy.removeFromParent()
            }
        }
        enumerateChildNodes(withName: "ob6") {
            node, stop in
            let Enemy = node as! SKSpriteNode
            
            if (Enemy.position.x < self.cameraNode.position.x-self.screenSize.width/2) {
                
                Enemy.removeFromParent()
            }
        }
        
        /* End */
        
        
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let UITouch : UITouch = touches.first!
        let touchedNode = self.atPoint(UITouch.location(in: self))
        
        if(touchedNode.name == "Restart") {
            
            let newScene = GameScene()
            newScene.scaleMode = .resizeFill
            view?.presentScene(newScene)
            
        }
        if(touchedNode.name == "Quit") {
            
            self.view?.presentScene(nil)
            
        }
        
        
        
        for touch in touches {
            let location = touch.location(in: cameraNode) //Set the tapping part on the camera view
            
            if (location.x > screenSize.width/2){  //Tap on half screen to resize or ump
                player.run(player.resize())
                
                run(jumpResizeSound)
            }
            else if (location.x < screenSize.width/2) {
                if(jumpTrigger) {
                    
                    player.jump()
                    jumpTrigger = false
                    run(jumpResizeSound)
                }
            }
            
        }
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
//        let bodyA = contact.bodyA.node?.name
//        let bodyB = contact.bodyB.node?.name
//
//
//        if(contact.bodyA.node?.name == "ground") {
//            print("hello\(Int.random(in: 0...100))")
//        }
//
//        if (contact.bodyA.node?.name == "ground" && contact.bodyB.node?.name == "Player" ) {
//
//            jumpTrigger = true
//            player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
//
//        }
//
//
//        if((bodyA == "ob1" || bodyA == "ob2" || bodyA == "ob3") && bodyB == "Player" ) {
//
//
//            if(player.state == .Big)
//            {
//                contact.bodyA.node?.run(SKAction.resize(byWidth: -100, height: -100, duration: 1))
//            }
//            else if (player.life > 1)
//            {
//
//                player.life -= 1
//                player.setNewTexture(life: String(player.life))
//                player.run(player.endlessRunAnimation())
//                run(damageSound)
//
//            }
//            else {
//                gameOver()
//
//            }
//            contact.bodyA.node?.physicsBody = nil
//        }
//
//
//        if((bodyA == "ob4" || bodyA == "ob5" || bodyA == "ob6") && bodyB == "Player") {
//
//            obstacle.removeFromParent()
//            if((player.state == .Small || player.state == .Big) && player.life > 1)
//            {
//                player.life -= 1
//                player.setNewTexture(life: String(player.life))
//                player.run(player.endlessRunAnimation())
//                run(damageSound)
//
//            }
//            else {
//                gameOver()
//            }
//
//
//            contact.bodyA.node?.physicsBody = nil
//        }
//
        
        
    }
    
    func createFrontParallax() { //Function to create front Parallax
        
        parallax_bg_1[0] = SKSpriteNode(imageNamed: "background0-\(Int.random(in: 1...7))")
        parallax_bg_1[0].position = background_1.position
        
        parallax_bg_1[0].size = CGSize(screenSize: screenSize)
        parallax_bg_1.append( SKSpriteNode(imageNamed: "background0-\(Int.random(in: 1...7))"))
        parallax_bg_1[1].position = background_2.position
        parallax_bg_1[1].size = CGSize(screenSize: screenSize)
        parallax_bg_1.append(SKSpriteNode(imageNamed: "background0-\(Int.random(in: 1...7))"))
        parallax_bg_1[2].position = background_3.position
        parallax_bg_1[2].size = CGSize(screenSize: screenSize)
        
        
        parallax_bg_1[0].zPosition = 2
        parallax_bg_1[1].zPosition = 2
        parallax_bg_1[2].zPosition = 2
        
        addChild(parallax_bg_1[0])
        addChild(parallax_bg_1[1])
        addChild(parallax_bg_1[2])
    }
    
    func createParallax() { //Function to create Parallax
        
        parallax_bg_2[0] = SKSpriteNode(imageNamed: "background2-\(Int.random(in: 1...4))")
        parallax_bg_2[0].position = background_1.position
        parallax_bg_2[0].size = CGSize(screenSize: screenSize)
        parallax_bg_2.append( SKSpriteNode(imageNamed: "background2-\(Int.random(in: 1...4))"))
        parallax_bg_2[1].position = background_2.position
        parallax_bg_2[1].size = CGSize(screenSize: screenSize)
        parallax_bg_2.append(SKSpriteNode(imageNamed: "background2-\(Int.random(in: 1...4))"))
        parallax_bg_2[2].position = background_3.position
        parallax_bg_2[2].size = CGSize(screenSize: screenSize)
        
        
        parallax_bg_3[0] = SKSpriteNode(imageNamed: "background3-\(Int.random(in: 1...3))")
        parallax_bg_3[0].position = background_1.position
        parallax_bg_3[0].size = CGSize(screenSize: screenSize)
        parallax_bg_3.append( SKSpriteNode(imageNamed: "background3-\(Int.random(in: 1...3))"))
        parallax_bg_3[1].position = background_2.position
        parallax_bg_3[1].size = CGSize(screenSize: screenSize)
        parallax_bg_3.append(SKSpriteNode(imageNamed: "background3-\(Int.random(in: 1...3))"))
        parallax_bg_3[2].position = background_3.position
        parallax_bg_3[2].size = CGSize(screenSize: screenSize)
        
        parallax_bg_4[0] = SKSpriteNode(imageNamed: "background4-1")
        parallax_bg_4[0].position = background_1.position
        parallax_bg_4[0].size = CGSize(screenSize: screenSize)
        parallax_bg_4.append( SKSpriteNode(imageNamed: "background4-1"))
        parallax_bg_4[1].position = background_2.position
        parallax_bg_4[1].size = CGSize(screenSize: screenSize)
        parallax_bg_4.append(SKSpriteNode(imageNamed: "background4-1"))
        parallax_bg_4[2].position = background_3.position
        parallax_bg_4[2].size = CGSize(screenSize: screenSize)
        
        parallax_bg_5[0] = SKSpriteNode(imageNamed: "background5-\(Int.random(in: 1...3))")
        parallax_bg_5[0].position = background_1.position
        parallax_bg_5[0].size = CGSize(screenSize: screenSize)
        parallax_bg_5.append( SKSpriteNode(imageNamed: "background5-\(Int.random(in: 1...3))"))
        parallax_bg_5[1].position = background_2.position
        parallax_bg_5[1].size = CGSize(screenSize: screenSize)
        parallax_bg_5.append(SKSpriteNode(imageNamed: "background5-\(Int.random(in: 1...3))"))
        parallax_bg_5[2].position = background_3.position
        parallax_bg_5[2].size = CGSize(screenSize: screenSize)
        
        
        addChild(parallax_bg_5[0])
        addChild(parallax_bg_5[1])
        addChild(parallax_bg_5[2])
        addChild(parallax_bg_4[0])
        addChild(parallax_bg_4[1])
        addChild(parallax_bg_4[2])
        addChild(parallax_bg_3[0])
        addChild(parallax_bg_3[1])
        addChild(parallax_bg_3[2])
        addChild(parallax_bg_2[0])
        addChild(parallax_bg_2[1])
        addChild(parallax_bg_2[2])
        
        
        
    }
    
    func addObstacle(){
    
        let source = "ob\(Int.random(in: 1...6))"
        obstacle = Obstacle(source: source)
        obstacle.position.x = obstacle_2.position.x + getObstaclePosition(screenSize: screenSize)
        obstacle.position.y = background_0_1.frame.maxY
        obstacle.name = source
        obstacle.zPosition = 0
        addChild(obstacle)
    
    }
    
    func addObstacle2(){
        
        let source = "ob\(Int.random(in: 1...6))"
        obstacle_2 = Obstacle(source: source)
        obstacle_2.position.x = obstacle.position.x + getObstaclePosition(screenSize: screenSize)
        obstacle_2.position.y = background_0_1.frame.maxY
        obstacle_2.name = source
        obstacle_2.zPosition = 0
        addChild(obstacle_2)

    }
    
    func generateObstacle () -> SKAction {
        
        let action_a = SKAction.wait(forDuration: 1.5)
        let action_b = SKAction.run { [weak self] in
            self?.addObstacle()
            self?.addObstacle2()
        }
        let action_c = SKAction.sequence([action_b,action_a])
        
        return SKAction.repeatForever(action_c)
        
    }
    
    func movementParallax () { // TO DO PARALLAX
        
        
    }
    
    func gameOver () {
        
        score.removeFromParent()
        player.life = 0
        center_test.position = cameraNode.position
        background_gameOver.position = cameraNode.position
        restartButton.position.x = cameraNode.position.x-125
        restartButton.position.y = cameraNode.position.y
        quitButton.position.x = cameraNode.position.x+125
        quitButton.position.y = cameraNode.position.y
        score.position.y = cameraNode.position.y+150
        score.position.x = cameraNode.position.x
        score.fontSize = 25
        score.fontName = "Didot Bold"
        score.text = "Final Score: \(numbScore)"
        obstacle.removeFromParent()
        player.removeFromParent()
        HUD.removeFromParent()
        cameraNode.removeFromParent()
        camera?.removeFromParent()
        self.removeAllActions()
        addChild(background_gameOver)
        addChild(restartButton)
        addChild(quitButton)
        addChild(score)
        
        
        print(quitButton.size)
        
    }
    
    
    func addMultipleChild() {
        
        
        
        /* Add child */
        createParallax()
        addChild(background_3)
        addChild(background_2)
        addChild(background_1)
        addChild(background_0_1)
        addChild(background_0_2)
        addChild(background_0_3)
        addChild(obstacle)
        addChild(obstacle_2)
        run(generateObstacle())
        addChild(player)
        createFrontParallax()
        addChild(HUD)
        addChild(score)
        
        
        addChild(back_bg6)
        addChild(back_bg5)
        addChild(back_bg4)
        addChild(back_bg3)
        addChild(back_bg2)
        addChild(back_bg1)
        addChild(center_test)
        
        /*End */
    }
    
}


//
//Funghetti1 445x390
//Funghetti2 424x390
//Funghetti3 559x199
//Ostacolo verticale 157x443
//Spuntoni1 143x151,67
//Spuntoni2 170x179
//Spuntoni3 150x126




// 1 2
