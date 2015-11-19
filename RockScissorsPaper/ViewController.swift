//
//  ViewController.swift
//  RockScissorsPaper
//
//  Created by Dave Vo on 10/24/15.
//  Copyright © 2015 Dave Vo. All rights reserved.
//

import UIKit

let ROCK = 0
let PPER = 1
let SCRS = 2

class ViewController: UIViewController {
    var gamePlayed = 0
    var gameWin = 0
    var gameLose = 0
    var gameDraw = 0
    
    @IBOutlet weak var playedLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var drawLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    
    @IBOutlet weak var winPercentageLabel: UILabel!
    @IBOutlet weak var drawPercentageLabel: UILabel!
    @IBOutlet weak var losePercentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* Randomize computer's choice
    *  result from 0 to 2
    */
    func randomPick() -> Int {
        return Int(arc4random() % 3)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "scissorsPlay" {
            // This is segue used for Scissors button
            // using segue + code
            let controller = segue.destinationViewController as! ResultViewController
            controller.computerSelection = randomPick()
            controller.playerSelection = SCRS
            playedLabel.text = "\(++gamePlayed)"
        } else if segue.identifier == "paperPlay" {
            // TODO: how to transfer data to next VC?
            let controller = segue.destinationViewController as! ResultViewController
            controller.computerSelection = randomPick()
            controller.playerSelection = PPER
            playedLabel.text = "\(++gamePlayed)"
        }
    }
    
    @IBAction func showResultUsingSegue(sender: UIButton) {
        self.performSegueWithIdentifier("scissorsPlay", sender: self)
    }
    
    // Show next VC using purely code, for Rock button
    @IBAction func showResult(sender: UIButton) {
        var controller:ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("resultViewController") as! ResultViewController
        
        controller.computerSelection = randomPick()
        controller.playerSelection = ROCK
        
        playedLabel.text = "\(++gamePlayed)"
        
        self.presentViewController(controller, animated: true, completion: nil)
    }

}

