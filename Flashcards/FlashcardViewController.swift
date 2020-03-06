//
//  ViewController.swift
//  Flashcards
//
//  Created by Alexander Shapiro on 2/8/20.
//  Copyright © 2020 Alexander Shapiro. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var front: UILabel!
    @IBOutlet weak var back: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        card.layer.cornerRadius = 10.0
        front.layer.cornerRadius = 10.0
        back.layer.cornerRadius = 10.0
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        front.clipsToBounds = true
        back.clipsToBounds = true
    }

    
    @IBAction func didTapFlashcard(_ sender: Any) {
        if (!front.isHidden) {
            front.isHidden = true
        } else {
            front.isHidden = false
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        front.text = question
        back.text = answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
}

