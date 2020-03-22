//
//  ViewController.swift
//  Flashcards
//
//  Created by Alexander Shapiro on 2/8/20.
//  Copyright © 2020 Alexander Shapiro. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class FlashcardViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var front: UILabel!
    @IBOutlet weak var back: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    
    var flashcards = [Flashcard]()
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readSavedFlashcards()
        
        card.layer.cornerRadius = 10.0
        front.layer.cornerRadius = 10.0
        back.layer.cornerRadius = 10.0
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        front.clipsToBounds = true
        back.clipsToBounds = true
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What is the capital of the Republic of Korea?", answer: "Seoul")
        } else {
            updateLabels()
            updateNavButtons()
        }
    }

    
    @IBAction func didTapFlashcard(_ sender: Any) {
        flipFlashcard()
    }
    
    func flipFlashcard() {
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations: {
            if (!self.front.isHidden) {
                self.front.isHidden = true
            } else {
                self.front.isHidden = false
            }
        })
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        
        updateNavButtons()
        animateCardOut(direction: "l")
    }
    
    @IBAction func didTapOnPrevious(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateNavButtons()
        animateCardOut(direction: "r")
    }
    
    func animateCardOut(direction: String) {
        var dir = CGFloat.init(0.0)
        if direction == "l" {
            dir = -1.0
        } else {
            dir = 1.0
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: dir * 400.0, y: 0.0)
        }) { (finished) in
            self.updateLabels()
            self.animateCardIn(direction: direction)
        }
    }
    
    func animateCardIn(direction: String) {
        var dir = CGFloat.init(0.0)
        if direction == "l" {
            dir = -1.0
        } else {
            dir = 1.0
        }
        card.transform = CGAffineTransform.identity.translatedBy(x: dir * -400.0, y: 0.0)
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity
        })
    }
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        
        flashcards.append(flashcard)
        print("🆕 Added new flashcard")
        
        currentIndex = flashcards.count - 1
        print("#️⃣ We now have \(flashcards.count) flashcards")
        
        updateNavButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        
        front.text = currentFlashcard.question
        back.text = currentFlashcard.answer
    }
    
    func updateNavButtons() {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0 {
            previousButton.isEnabled = false
        } else {
            previousButton.isEnabled = true
        }
    }
    
    func saveAllFlashcardsToDisk() {
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("💾 Saved all flashcards to disk")
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
}

