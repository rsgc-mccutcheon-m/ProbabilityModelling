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

var die1 = dice(faces: 6, ID: "die1")
var die2 = dice(faces: 6, ID: "die2")

var players : [gameBoard] = [] //holds each of the player scorecards, which track wins, picks, and round scoring info

var scores : [Int] = []

//MARK: Game Setup

players = gameSetup() //call the function that handles the gameboard initialization process. Returns an array of initialized gameboards.


var rollVal = (die1.roll() + die2.roll())

for _ in 0...4 {
for ( Index, player ) in players.enumerated() {
    
    player.check(rollVal: rollVal) //check if any of the player's picks are activated/deactivated
    player.tally()
    print(player.player)
    print("Your current tally is \(player.score)") //show each player their current score
}
}

for Index in 0...players.count-1 {
    scores.append(players[Index].score)
}

scores.sort(by: >)

for player in players {
    
    if player.score == scores[0] {
        
        player.wins += 1
    }
}







