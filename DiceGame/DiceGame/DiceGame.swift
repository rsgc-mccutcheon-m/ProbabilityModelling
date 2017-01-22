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
    
    init(Count: Int , Players: [player]) {
        
        self.playerCount = Count
        self.players = Players
        
        self.winningHands = [[]]
    }
    
    func playRound() {
        
        var scores : [Int] = []
        
        for i in 0...4 {
            
            var roll = die1.roll() + die2.roll()
            
            for (Index, Player) in players.enumerated() {
                
                Player.check(rollVal: roll)
                
            }
            
        }
        
        
        scores.sort(by: >)
        for Player in players {
            
            if Player.score == scores[0] {
                
                Player.wins += 1
                self.winningHands.append(Player.boardPicks)            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

}
