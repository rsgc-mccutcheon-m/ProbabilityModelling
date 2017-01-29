//
//  main.swift
//  DiceGame
//
//  Created by Jarvis on 2017-01-16.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


//MARK: GameBoard Class Init
var Game  = DiceGame() //create an instance of the game to be played
var mode : Bool


//MARK: Begin normal play
mode = Game.promptPlay()! // decide if the player would like to play a game, or test strats (True=Game, False=strats)

if mode { //the player has decided to play a game
    Game.getCount() //get the desired number of players
    Game.players = Game.inputPlayerPicks() //get the number picks and playewr name of each player, and create an array of players of type player.
    Game.playRound()  //get a roll, test it against everyones boards, repeat 5x, check who won
    
    while (Game.promptRound()) { //check if another round is desired
        for Player in Game.players { //get new number picks
            Player.refresh(picks: Game.getPicks(name: Player.name))
        }
        Game.playRound() //get a roll, test it against everyones boards, repeat 5x, check who won
    }
    
    Game.endGame() //exit and print overall winner
    
    
    //MARK: Begin Strats Testing
} else{
    
    Game.promptStrats() //get ID and numbers for each board to be run, and number of iterations to test (1-300)
    
    for i in 0...Game.roundCount - 1 { //run for the input number of iterations
        Game.playRound() //get a roll, test it against everyones boards, repeat 5x, check who won
    }
    Game.endGame() //exit and print overall winner
}














