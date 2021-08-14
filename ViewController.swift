//
//  ViewController.swift
//  TicTacToe
//
//  Created by Daniel Manta on 05.07.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var activePlayer = 1
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningconbination = [[0, 1, 2] , [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4 ,6]]
    
    var gameIsActive = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Action(_ sender: AnyObject) {
        
        if game[sender.tag - 1] == 0 {
            
            game[sender.tag - 1] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "x.png"), for: UIControl.State())
                activePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "0.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningconbination {
            
            gameIsActive = false
            
            if game[combination[0]] != 0 && game[combination[0]] == game[combination[1]] && game[combination[1]] == game[combination[2]]{
                
                gameIsActive = false
                
                if game[combination[0]] == 1 {
                    label.text = "Cross has Win!"
                }
                else if game[combination[0]] == 2{
                    label.text = "Zero has Win !"
                }
                play.isHidden = false
                label.isHidden = false
            }
        }
        if play.isHidden == true && gameIsActive == true{
          label.text = "Tie!"
          play.isHidden = false
          label.isHidden = false
        }

    }
    
    @IBOutlet weak var play: UIButton!
    @IBAction func play(_ sender: AnyObject) {
        game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        play.isHidden = true
        label.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
}

