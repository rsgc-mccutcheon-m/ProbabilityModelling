//
//  gameBoardClass.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-18.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation

class player {
    
    var name : String
    var wins : Int
    var boardPicks = [Int]() //store 5 chosen game board values to check against
    var boardStatus = [Bool]() //store the status of the five game spaces
    var score : Int
    
    
    
    init (picks : [Int], player : String ) {
        
        self.boardPicks = picks //set the player's pick array to the input int array
        
        
        //set to the dafault of none true before play
        self.boardStatus = [
            false, false, false, false, false
        ]
        
        self.name = player //set player name to the String passed in the init
        self.wins = 0 //set wins to default of 0 to begin
        self.score = 0
        
    }
    
    
    //run after each roll to check if the player gets to cross off a number, or uncross a number
    func check(rollVal : Int ) {
        for (index, pick) in self.boardPicks.enumerated() {
            
            if pick == rollVal {
                self.boardStatus[index] = !self.boardStatus[index]
            }
        }
    }
    
    //run at end of round to get a players finishing count
    func tally() {
        score = 0
        for (index, pick) in self.boardPicks.enumerated() { //iterate through 5 indicies
            
            if self.boardStatus[index] == false { //check if the value at a given index has been crossed out, or uncrossed, or whatnot
                self.score += pick //if the value is in play, add it to the final tally for that round
            }
        }
    }
    
    //run at end of round to re-pick and play again. will need to create a new array of picks to input
    func refresh(picks : [Int]) {
        
        self.score = 0
        self.boardPicks = []
        self.boardStatus = [
            false, false, false, false, false
        ]
        
        self.boardPicks = picks
    }
}
