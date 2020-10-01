//
//  Extension.swift
//  Waffle_Game
//
//  Created by Aiello Giovanni on 31/03/2020.
//  Copyright © 2020 HangoverTeam. All rights reserved.
//

//Funghetti1 445x390
//Funghetti2 424x390
//Funghetti3 559x199
//Ostacolo verticale 157x443
//Spuntoni1 143x151,67
//Spuntoni2 170x179
//Spuntoni3 150x126

import Foundation
import SpriteKit
import UIKit


extension CGSize {    //Extension to assign the size of the screen to BG
    public init(screenSize : CGRect)
    {
        self.init()
        width = screenSize.width
        height = screenSize.height
    }
    
    public init (obstacleSize: CGRect,name: String)
    {
        
        self.init()
        
        if(obstacleSize.width != 896) {
            if (name == "ob1" || name == "ob2" || name == "ob3") {
            width = (obstacleSize.width*250)/896
            height = width
            }
            if (name == "ob4" || name == "ob5" || name == "ob6") {
            width = (obstacleSize.width*75)/896
            height = width
            }
        }
        else {
            if (name == "ob1" || name == "ob2" || name == "ob3") {
                width = 250
                height = width
            }
            if (name == "ob4" || name == "ob5" || name == "ob6") {
                width = 75
                height = width
            }
        }
        
    }
    
    
    
    public init (characterSize : CGRect)  //Extension to calculate the size of the player based on the device
    {
        self.init()
        if(characterSize.width != 896) {
            width = (characterSize.width*100)/896
        }
        else {
            width = 100
        }
        
        height = width * 1.09
    }
    
    
    public init (sizeButtonRestart: CGRect) {
        
        self.init()
        if(sizeButtonRestart.width != 896) {
            width = (sizeButtonRestart.width*182)/896
        }
        else {width = 182}
        
        if(sizeButtonRestart.height != 414) {
            height = (sizeButtonRestart.height*159)/414
        }
        else {height = 159}
        
    }
    public init (sizeButtonQuit: CGRect) {
          
          self.init()
          if(sizeButtonQuit.width != 896) {
              width = (sizeButtonQuit.width*101)/896
          }
          else {width = 101}
          
          if(sizeButtonQuit.height != 414) {
              height = (sizeButtonQuit.height*160)/414
          }
          else {height = 160}
          
      }

    public init(playButtonSize: CGRect) {
        
        self.init()
        if(playButtonSize.width != 896) {
            width = (playButtonSize.width*200)/896
        }
        else {width = 200}
        
        if(playButtonSize.height != 414) {
            height = (playButtonSize.height*136)/414
        }
        else {height = 136}
        
    }
}

extension CGPoint {   //Extension to get CGPoint(x:0,y:0)
    public init (null : Int) {
        self.init()
        x = 0
        y = 0
    }
    
    public init (screenSize: CGRect) {  //Extension to get the center of the screen
        self.init()
        x = screenSize.width/2
        y = screenSize.height/2
    }
     
    public init(playButtonScreen: CGRect) { //Extension to get the position of play button in main menu
        self.init()
        if(playButtonScreen.width == 896){
            x =  625
        }
            
        else {
            x = playButtonScreen.width*625/896
        
        }
        
        if(playButtonScreen.height == 414){
            y = 60
        }
        else{
            y = playButtonScreen.height*60/414
        }
    }
}

extension CGFloat {
    
    static func returnImpulse (bodyMass: CGFloat) -> CGFloat {
        
        var x : CGFloat = 0
        
        if (bodyMass != 0.3490658700466156) {
            x = (bodyMass*15000)/0.3490658700466156
        }
        else { x = 15000}
        
        return x
    }
    
    static func returnPositionSpawn (screenSize: CGRect) -> CGFloat {
        
        var final : CGFloat = 0
        if (screenSize.width != 896) {
            final = screenSize.width*1000/896
        }
        else {
            final = 1000
        }
        return final
    }
    
    static func returnFontSize (screenSize: CGRect) -> CGFloat {
        
        var x : CGFloat = 0
        
        if (screenSize.width != 896) {
            x = (screenSize.width*17)/896
        }
        else {  x = 17}
        return x
    }
    
    
    
    
}



func getRadius (screenSize: CGRect) -> CGFloat {  //function to get the circle radius
    
    var x : CGFloat
    if(screenSize.width != 896) {
        x = (screenSize.width*45)/896
    }
    else {
        x = 45
    }
    return x
    
}


func getSizeBg (screenSize: CGRect) -> CGFloat { //function to get the size of the invisible bg
    
    var x: CGFloat
    if(screenSize.height != 414) {
        x = (screenSize.height*35)/414
    }
    else {
        x = 35
    }
    
    return x
    
}

func getScorePositionX (screenSize: CGRect) -> CGFloat { //function to get the position (x) of the score
    
    var x : CGFloat = 0
    
    if (screenSize.width != 896) {
        x = screenSize.width*350/896
        
    }
    else { x = 350}
    
      return x
}

func getScorePositionY (screenSize: CGRect) -> CGFloat { //function to get the position (y) of the score
    
    var x : CGFloat = 0
    
    if (screenSize.height != 414) {
        x = screenSize.height*165/414
        
    }
    else { x = 165}
    
      return x
}


func getCameraPosition(screenSize: CGRect) -> CGFloat { //function to get camera position
    
    var x : CGFloat = 0
    if(screenSize.width != 896) {
        x = screenSize.width*300/896
    }
    else { x = 300 }
    
    return x
}

func getObstaclePosition (screenSize : CGRect) -> CGFloat { //function to get obstacle position
    
    var x : CGFloat = 0
    if(screenSize.width != 896) {
           x = screenSize.width*800/896
       }
       else { x = 800 }
       
       return x
    
    
}

