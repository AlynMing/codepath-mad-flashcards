//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Alexander Shapiro on 2/20/20.
//  Copyright © 2020 Alexander Shapiro. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController:  FlashcardViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        flashcardsController.updateFlashcard(question: questionTextField.text!, answer: answerTextField.text!)
        dismiss(animated: true)
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
