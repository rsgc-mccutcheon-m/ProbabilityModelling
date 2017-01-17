//
//  main.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-16.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation

struct gameBoard {
    
    var player : String
    var boardPicks = [Int]() //store 5 chosen game board values to check against
    var boardStatus = [Bool]() //store the status of the five game spaces
    var wins : Int
   
    
    
    init (picks : [Int], player : String ) {
        
        for pick in picks {
            self.boardPicks.append(pick) //iterate through the int array passed into the init ad slot them into the struct
        }
        
        //set to the dafault of none true before play
        self.boardStatus = [
         false, false, false, false, false
        ]
        
        self.player = player //set player name to the String passed in the init
        self.wins = 0 //set wins to default of 0 to begin
    }
    
    
    mutating func check(index : Int, rollVal : Int ) {
        
        if self.boardPicks[index] == rollVal {
            self.boardStatus[index] = !self.boardStatus[index]
        }
        
    }
    
    func tally() {
       
        
        
        
    }
}

