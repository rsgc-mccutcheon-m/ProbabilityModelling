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
    
    init() {
        
        self.playerCount = 0
        self.players = []
        
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
    
    func promptPlay() -> Bool? {
        print("Would you like to play a game of Dice, or test the effectiveness of strategies? (Respond: game or strats")
        var ret : Bool? = nil
        var inString : String = "X"
        repeat{
            if let inStr = readLine(strippingNewline: true){ //strip the response string
                inString = inStr //put it into a variable instead of a constant
                if inString == "game" { //check if they responded game, true return value will be used to trigger other logic
                    ret = true
                    
                    
                } else if inString == "strats" { //check if they responded strats, false return value will be used to trigger other logic
                    ret = false
                    
                    
                } else {
                    print("Please respond with either: game, or strats")
                    inString = "X" //if the response is neither, keep looping, and re-prompt
                    
                }
                
            }
        } while (inString == "X")
        
        return ret
    }
    
    
    func inputPlayerPicks() -> [player] {
        
        
        //Acquire the desired number of players
        var success : Bool = false
        repeat {
            print("Input an integer representing the desired number of players (1-10)")
            if let inCountstr = readLine(strippingNewline: true) {
                
                if let inCount : Int = Int(inCountstr){
                    
                    if inCount > 0 && inCount <= 10 {
                        
                        self.playerCount = inCount
                        success = true
                        
                    } else {
                        print("Please input a number between 0 and 11, exclusive")
                    }
                    
                } else {
                    print("Please input an integer between 0 and 11, exclusive")
                }
            }
        } while(!success)
        
        
        
    }
    
    func getPicks() {
        //Get the choices for each player
        for index in 0...self.playerCount-1 {
            var playerName : String = "~"
            var playerPicks : [Int] = []
            var inString : String
            var success : Bool
            
            repeat {
                print("Player \(index) please input your name")
                if let inString = readLine(strippingNewline: true) {
                    
                    playerName = inString
                    
                }
            } while (playerName == "~")
            
            success = false
            print("\(playerName) We will now input your 5 dice roll picks")
            for marker in 0...4{
                repeat {
                   print("Please input an integer representing your space \(marker) pick")
                    if let inStr = readLine(strippingNewline: true)
                    
                    
                    
                } while (!success)
                
                
                
                
                
                
            }
        }
    }
    
    
    func runStrats(){
        
        
        
    }
    
}

