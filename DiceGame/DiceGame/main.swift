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






//MARK: Global Objects

var die = dice(faces: 6, ID: "die1")

var players : [gameBoard] = [] //holds each of the player scorecards, which track wins, picks, and round scoring info


//MARK: Poll Input Function

func gameSetup() -> [gameBoard] {

var store : [gameBoard] = []
    
var playerCount : Int = 0 //holds the # of players desired, currently limmited to 5 for no particular reason

var playerName : String //will temporarily hold an input player name before it is dumped into a gameBoard instance

var inPicks : [Int] //will temporarily hold an input set of 5 picked numbers before it is dumped into a gameBoard instance

var success : Bool //used in input control logic

//set of prompt text strings
let promptCount = "Please specify the desired number of players as an integer: "

let promptName = "Please input your name: "

let promptPick = "Please input an integer between 1 and 12:  "

//poll for number of players
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

//poll for the data required to fill each scorecard
for index in 0...(playerCount-1) { //iterate once for every card to be generated
    
    inPicks = []
    
    playerName = "X"
    
    //poll for a name
    repeat {
        print(promptName)
        
        if let plyrNm = readLine(strippingNewline: true) { //ensure a name has been input
            playerName = plyrNm
        
        }
    } while (playerName == "X")
    
    
    //poll for an array of 5 number picks
    while inPicks.count != 5 {
    
        //poll for a pick
    repeat {
        print(promptPick)
        
        success = false //set polling control to false until proven otherwise
        
        if let plyrPk = readLine(strippingNewline: true) { //ensure the pick is an integer
            
            if let plyrPk = Int(plyrPk) {
                
                if plyrPk > 0 && plyrPk < 13 {
                    
                    success = true //break the polling loop for this pick
                    inPicks.append(plyrPk) //add the pick to a temporary storage array
                }
            }
        }
    } while (!success) //break the input pick polling loop when a valid pick is input
        
    //on 5th iteration continue past the while loop
    }
    
    //initialize the collected picks, and name into a gameboard object
    let tempBoard = gameBoard(picks: inPicks, player: playerName)
    
    //add the gameboard to the array of player gameboards, should be 1 per player
    store.append(tempBoard)
}
    
    //output the array of gameboards to whatever variable is waiting to receive them
    return store

}


