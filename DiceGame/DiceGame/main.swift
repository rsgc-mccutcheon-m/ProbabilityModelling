//
//  main.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-16.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


//MARK: GameBoard Struct

struct gameBoard {
    
    var player : String
    var wins : Int
    var boardPicks = [Int]() //store 5 chosen game board values to check against
    var boardStatus = [Bool]() //store the status of the five game spaces
    var score : Int
   
    
    
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
        self.score = 0
        
    }
    
    
    //run after each roll to check if the player gets to cross off a number, or uncross a number
    mutating func check(index : Int, rollVal : Int ) {
        
        if self.boardPicks[index] == rollVal {
            self.boardStatus[index] = !self.boardStatus[index]
        }
        
    }
    
    //run at end of round to get a players finishing count
    mutating func tally() {
        for index in 0...4 { //iterate through 5 indicies
            
            if self.boardStatus[index] == false { //check if the value at a given index has been crossed out, or uncrossed, or whatnot
                self.score += self.boardPicks[index] //if the value is in play, add it to the final tally for that round
            }
        }
    }
    
    //run at end of round to re-pick and play again. will need to create a new array of picks to input
    mutating func refresh(picks : [Int]) {
        
        self.score = 0
        self.boardPicks = []
        self.boardStatus = [
            false, false, false, false, false
        ]
        
        for pick in picks {
            self.boardPicks.append(pick)
        }
    }
}


//MARK: Global Input Variables



