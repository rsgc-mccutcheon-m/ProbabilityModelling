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

var playerCount : Int = 0 //holds the # of players desired, currently limmited to 5 for no particular reason

var players : [gameBoard] = [] //holds each of the player scorecards, which track wins, picks, and round scoring info

var playerName : String //will temporarily hold an input player name before it is dumped into a gameBoard instance

var inPicks : [Int] //will temporarily hold an input set of 5 picked numbers before it is dumped into a gameBoard instance

var success : Bool //used in input control logic

//set of prompt text strings
var promptCount = "Please specify the desired number of players as an integer: "

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
    
    playerName = "X"
   
    repeat {
        print(promptName)
        
        if let plyrNm = readLine(strippingNewline: true) {
            playerName = plyrNm
        
        }
    } while (playerName == "X")
    
    while inPicks.count != 5 {
    
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
    
    var tempBoard = gameBoard(picks: inPicks, player: playerName)
    
    players.append(tempBoard)
}






