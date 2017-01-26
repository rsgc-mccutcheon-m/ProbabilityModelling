//
//  main.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-16.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


//MARK: GameBoard Class Init
var Game  = DiceGame()
var mode : Bool

mode = Game.promptPlay()!

if mode {
    Game.getCount()
    Game.players = Game.inputPlayerPicks()
    Game.playRound()
    
    while (Game.promptRound()) {
        for Player in Game.players {
            Player.refresh(picks: Game.getPicks(name: Player.name))
        }
        Game.playRound()
    }
    
    Game.endGame()
} else{
    
    Game.promptStrats()
    
    
    
    
    
}


//MARK: Global Input Variables



//MARK: Global Objects

//holds each of the player scorecards, which track wins, picks, and round scoring info

//MARK: Game Setup
//call the function that handles the gameboard initialization process. Returns an array of initialized gameboards.













