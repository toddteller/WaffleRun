//
//  File.swift
//  WaffleRun
//
//  Created by Aiello Giovanni on 03/04/2020.
//  Copyright © 2020 HangoverTeam. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class Obstacle : SKSpriteNode {
    
    let screenSize = UIScreen.main.bounds
    var body : SKPhysicsBody
    var rand = Int.random(in: 1...7)
    var sizeO : CGSize
    var destroyed : Bool
    
    init (source: String) {
        self.sizeO = CGSize(obstacleSize: screenSize, name: source)
        self.body = SKPhysicsBody(rectangleOf:  sizeO)
        body.categoryBitMask = 0b0001
        body.collisionBitMask = 0b0010
        body.affectedByGravity = false
        body.isDynamic = true
        self.destroyed = false
        super.init(texture: SKTexture(imageNamed: "\(source)"), color: UIColor.clear, size:sizeO )
        self.name = "obstacle"
        self.physicsBody = body
        self.position.y = 70
        self.name = name
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
