//
//  ResultViewController.swift
//  RockScissorsPaper
//
//  Created by Dave Vo on 10/24/15.
//  Copyright © 2015 Dave Vo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var computerSelection: Int!
    var playerSelection: Int!
    var winner: String!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        switch computerSelection {
        case PPER:
            switch playerSelection {
            case PPER:
                resultImage.image = UIImage(named: "tie")
                resultLabel.text = ""
            case ROCK:
                resultImage.image = UIImage(named: "PaperCoversRock")
                resultLabel.text = "You lose :("
            case SCRS:
                resultImage.image = UIImage(named: "ScissorsCutPaper")
                resultLabel.text = "You win :)"
            default: resultLabel.text = ""
            }
            
        case ROCK:
            switch playerSelection {
            case PPER:
                resultImage.image = UIImage(named: "PaperCoversRock")
                resultLabel.text = "You win :)"
            case ROCK:
                resultImage.image = UIImage(named: "tie")
                resultLabel.text = ""
            case SCRS:
                resultImage.image = UIImage(named: "RockCrushesScissors")
                resultLabel.text = "You lose :("
            default: winner = ""
            }
            
        case SCRS:
            switch playerSelection {
            case PPER:
                resultImage.image = UIImage(named: "ScissorsCutPaper")
                resultLabel.text = "You lose :("
            case ROCK:
                resultImage.image = UIImage(named: "RockCrushesScissors")
                resultLabel.text = "You win :)"
            case SCRS:
                resultImage.image = UIImage(named: "tie")
                resultLabel.text = ""
            default: resultLabel.text = ""
            }

            default: resultLabel.text = ""
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismissView(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
