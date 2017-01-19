//
//  diceClass.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-19.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


class dice {
    
    var faces : Int
    
    var ID : String //an ID tag just in case one needs to distinguish between two instances of dice
    
    var lastRoll : Int?
    
    init (faces: Int, ID: String) {
        
        self.faces = faces
        self.ID = ID
        self.lastRoll = nil

    }
    
    //return a random int that is a member of the set of face values
    func roll() -> Int {
    
    var rollVal = Int(arc4random_uniform(UInt32(self.faces)))
    
    //store the roll value in case it needs to be recalled later
    lastRoll = rollVal
    
    //output the roll
    return Int(rollVal)
    }
}
