//
//  Player.swift
//  Waffle_Game
//
//  Created by Aiello Giovanni on 30/03/2020.
//  Copyright © 2020 HangoverTeam. All rights reserved.
//

import Foundation
import SpriteKit


class Player: SKSpriteNode {
    
    var state : State //The state of the player based on the State enum
    var textures : [SKTexture]  //The array that contains all the textures of the player//The size of the array
    let screenSize = UIScreen.main.bounds //Size of the actual device's screen
    var body : SKPhysicsBody //Physics body of character
    var lastSize : CGSize
    var life : Int
    
    
    init(numberT: Int,imageName: String) {  //Init (The size of the array,Path Image)
        self.state = .Small
        self.textures = [SKTexture(imageNamed: "\(imageName)1")]
        self.body =  SKPhysicsBody(circleOfRadius: getRadius(screenSize: screenSize))
        self.life = 3
        body.affectedByGravity = true
        body.isDynamic = true
        body.friction = 0
        body.categoryBitMask = 0b0001
        body.collisionBitMask = 0b0010
        body.contactTestBitMask = 0b0001
        self.lastSize = CGSize(characterSize: screenSize)
        
        
        for i in 2...numberT { //for to init the array
            self.textures.append(SKTexture(imageNamed: "\(imageName)\(i)"))
        }
        
        super.init(texture: SKTexture(imageNamed: "\(imageName)1"), color: UIColor.clear, size: self.lastSize)
        self.physicsBody = self.body
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func endlessRunAnimation() -> SKAction {  //Function that returns the endless run animation
        let animation = SKAction.repeatForever(SKAction.animate(with: self.textures, timePerFrame: 0.030))
        return animation
    }
    
    
    func jump() {//Function for the jump animation
        if(self.state == .Small) {
        self.body.applyForce(CGVector(dx: 0, dy: CGFloat.returnImpulse(bodyMass: self.body.mass)))
        }
        else { self.body.applyForce(CGVector(dx: 0, dy: CGFloat.returnImpulse(bodyMass: self.body.mass)/2))}
       
    }
    
    func resize() -> SKAction { //Function for the resize animation
        var animation = SKAction()
        if (self.state == .Small) {
            self.state = .Big
            animation = SKAction.resize(byWidth: 100, height: 100, duration: 0.15)
            newPhysicsBody()
        }
        else if (self.state == .Big) {
            self.state = .Small
            animation = SKAction.resize(byWidth: -100, height: -100, duration: 0.15)
            newPhysicsBody()
        }
        return animation
    }
    
    
    func newPhysicsBody() {//Function to get the new physics body
        
        if (self.state == .Big) {
            self.body =  SKPhysicsBody(circleOfRadius: getRadius(screenSize: screenSize)+50)
            body.affectedByGravity = true
            body.isDynamic = true
            body.friction = 0
            body.categoryBitMask = 0b0001
            body.collisionBitMask = 0b0010
            body.contactTestBitMask = 0b0001
            self.physicsBody = self.body
        }
        else if (self.state == .Small) {
            self.body =  SKPhysicsBody(circleOfRadius: getRadius(screenSize: screenSize))
            body.affectedByGravity = true
            body.isDynamic = true
            body.friction = 0
            body.categoryBitMask = 0b0001
            body.collisionBitMask = 0b0010
            body.contactTestBitMask = 0b0001
            self.physicsBody = self.body
        }
        
        
    }
    
    
    func setNewTexture (life: String)  {
        
        self.textures = [SKTexture(imageNamed: "\(life)hp-frame1")]
        
        for i in 2...14 { //for to init the array
                   self.textures.append(SKTexture(imageNamed: "\(life)hp-frame\(i)"))
               }
    
    }
    
    
    
}






enum State : String { //Enum with the case of the player' size
    case Big
    case Small
}

