//
//  ViewController.swift
//  Flashcards
//
//  Created by Alexander Shapiro on 2/8/20.
//  Copyright © 2020 Alexander Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var front: UILabel!
    @IBOutlet weak var back: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        front.clipsToBounds = true
        back.clipsToBounds = true
        
        front.layer.cornerRadius = 5.0
        back.layer.cornerRadius = 5.0
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        optionOne.layer.borderWidth = 3.0
        optionOne.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        optionOne.layer.cornerRadius = 5.0
        
        optionTwo.layer.borderWidth = 3.0
        optionTwo.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        optionTwo.layer.cornerRadius = 5.0
        
        optionThree.layer.borderWidth = 3.0
        optionThree.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        optionThree.layer.cornerRadius = 5.0
        
    }

    
    @IBAction func didTapFlashcard(_ sender: Any) {
        /*
        if (!front.isHidden) {
            front.isHidden = true
        } else {
            front.isHidden = false
        }
        */
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        optionOne.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        optionTwo.layer.borderColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        optionThree.isHidden = true
    }
}

