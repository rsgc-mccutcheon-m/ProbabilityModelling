//
//  DiceGame.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-22.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


class DiceGame {
    
    var playerCount : Int
    var players : [player]
    var winningHands : [[Int]]
    
    var die1 : dice = dice(faces: 6, ID: "dieOne")
    var die2 : dice = dice(faces: 6, ID: "dieTwo")
    
    init(playerCount: Int , players: [player]) {
        
        self.playerCount = playerCount
        self.players = players
        
        self.winningHands = [[]]
    }
    
    func playRound() {
        
        var scores : [Int] = []
        
        for i in 0...4 {
            
            var roll = die1.roll() + die2.roll()
            
            for Player in players {
                
                Player.check(rollVal: roll)
                Player.tally()
                print(Player.name)
                print("Your current tally is \(Player.score)") //show each player their current score
                
            }
            for Player in players {
                scores.append(Player.score)
            }
            
        }
        
        scores.sort(by: >)
        
        for Player in players {
            //check who has the score in the position sorted to the greatest. this method allows for ties
            if Player.score == scores[0] {
                
                Player.wins += 1
                self.winningHands.append(Player.boardPicks)            }
        }
    }
    
    func promptPlay() -> Bool {
        print("Would you like to play a game of Dice, or test the effectiveness of strategies? (Respond: game or strats")
        
        var inString : String = "X"
        repeat{
            if let inString = readLine(strippingNewline: true){
            
                if inString == "game" {
                    return true
                    
                } else if inString == "strats" {
                    return false
                    
                }
            
            }
    
    
        } while (inString == "X")
    }
}

