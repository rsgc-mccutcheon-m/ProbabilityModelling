//
//  main.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-16.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


//MARK: GameBoard Class Init



//MARK: Global Input Variables

var playerCount : Int = 0

var players : [gameBoard]

var inPicks : [Int]

var success : Bool

var promptCount = "Please specify the desired number of players as an integer:  "

var promptName = "Please input your name: "

var promptPick = "Please input an integer between 1 and 12:  "

//MARK: Poll Input



repeat {
    print(promptCount)
    
    if let plyrCnt = readLine(strippingNewline: true) {
        
        if let plyrCnt = Int(plyrCnt) {
            
            if plyrCnt > 0 && plyrCnt < 6 {
                
                playerCount = plyrCnt
            }
        }
    }
} while (playerCount == 0)



for index in 0...(playerCount-1) {
    
    inPicks = []
    
    var playerName : String = "X"
   
    repeat {
        print(promptName)
        
        if let plyrNm = readLine(strippingNewline: true) {
            playerName = plyrNm
        
        }
    } while (playerName == "X")
    
    for index in 0...4 {
    
    repeat {
        print(promptPick)
        
        success = false
        
        if let plyrPk = readLine(strippingNewline: true) {
            
            if let plyrPk = Int(plyrPk) {
                
                if plyrPk > 0 && plyrPk < 13 {
                    
                    success = true
                    inPicks.append(plyrPk)
                }
            }
        }
    } while (!success)
   
    }
    
    
    
    
    
}




