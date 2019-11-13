//
//  Dikshant_ViewController.swift
//  Dikshant_Dudhat_Red_TiTacToe
//
//  Created by Dikshant Dudhat on 2019-10-09.
//  Copyright © 2019 Harshkumar Patel. All rights reserved.
//

import UIKit

class Dikshant_ViewController: UIViewController {
    
    //MARK:- Class Variables
    
    var theGameModel = Dikshant_GameModel()
    var gameFinished = false
    var replyingPastGame = false
    var pastGameData : GameData?
    
    //MARK:- Outlets
    
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStateLabel.text = theGameModel.whoseTurn + "'s Turn"
        if(replyingPastGame){
            theGameModel.isPastGame = true
            //show past game
            navigationItem.title = "Past Game"
            // what were past moves
            let pastGameMoves = (pastGameData?.orderOfMoves)!
            
            var  delay : Double = Double(0)
            for i in pastGameMoves {
                delay = delay + 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    let button = self.view.viewWithTag(i)
                    self.squareTouched(button as! UIButton)
                })
                
            }
            
        }else{
            
        }

        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBActions
    
    
    @IBAction func squareTouched(_ sender: UIButton) {
        
        print("Button touched")
        print(sender.tag)
        if(sender.currentTitle == "X" || sender.currentTitle == "O" || gameFinished) {
            // Anyrthing
        }else{
            
            sender.setTitle(theGameModel.whoseTurn, for: .normal);
            theGameModel.playMove(tag: sender.tag)
            
            //check if game is finished
             gameFinished = theGameModel.isGameFinished()
            
            
            if(gameFinished){
                let whoWon = theGameModel.whoWon
                
                if(whoWon == ""){
                    gameStateLabel.text = "Draw!"
                }else{
                    gameStateLabel.text = whoWon + "Won!"
                }
            }else{
                gameStateLabel.text = theGameModel.whoseTurn + "'s Turn"
                          
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
