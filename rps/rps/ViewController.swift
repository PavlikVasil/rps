//
//  ViewController.swift
//  rps
//
//  Created by Павел on 10.02.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tryButton.isHidden = true
    }

    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var tryButton: UIButton!
    
    @IBAction func rockButton(_ sender: Any) {
        play(.rock)
    }
 
    @IBAction func scissorsButton(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func paperButton(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func tryButton(_ sender: Any) {
        reset()
    }
    
    func play(_ sign: Sign){
        var computerSign = randomSign()
        
        switch sign{
        case .paper:
            paperButton.isHidden = false
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .rock:
            paperButton.isHidden = true
            rockButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            paperButton.isHidden = true
            rockButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        tryButton.isHidden = false
        
        let result = sign.comparison(computerSign)
        
        switch result{
        case .draw:
            info.text = "\(computerSign.emoji) Draw"
            self.view.backgroundColor = UIColor.gray
        case .lose:
            info.text = "\(computerSign.emoji) Lose"
            self.view.backgroundColor = UIColor.red
        case .win:
            info.text = "\(computerSign.emoji) Win"
    
        }
        
    }
    
    func reset(){
        paperButton.isHidden = false
        rockButton.isHidden = false
        scissorsButton.isHidden = false
        tryButton.isHidden = true
        
        info.text = "Rock,Paper,Scissors?"
        self.view.backgroundColor = UIColor.white
    }
    
}

