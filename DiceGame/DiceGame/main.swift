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

var playerCount : Int

var inPicks : [Int]

var success : Bool

var promptCount = "Please specify the desired number of players as an integer:  "

//MARK: Poll Input


success = false //set input iteration control to default of false

repeat {
    
    print(promptCount)
    
    success = true
    guard let playerCount = readLine(strippingNewline: true) else {
    success = false
    }
    
} while (!success)

for index in 0...(playerCount-1) {
    
    
    
    
    
    
}




