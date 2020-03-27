//
//  ViewController.swift
//  Flashcardapp2
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Mubareka. All rights reserved.
//

import UIKit

struct Flashcardd {
    var question: String
    var answer: String
    var optionone: String
    var optiontwo: String
    var extraAnswerone: String
    var extraAnswertwo: String
    
    
}



class ViewController: UIViewController {

    
    @IBOutlet weak var Flashcard: UIView!
    
    @IBOutlet weak var Backlabel: UILabel!
    
    @IBOutlet weak var Frontlabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    @IBOutlet weak var optionThree: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var DeleteButton: UIButton!
    
    @IBOutlet weak var editButton: UIButton!
    
    //Array to hold our flash cards
    //Flashcardd not be confused with the IBoutlet flashcard with both cards
    var flashcards = [Flashcardd]()
    //current flashcard index
    var CurrentIndex = 0
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Flashcard.alpha = 0.0
        Flashcard.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.Flashcard.alpha = 1.0
            self.Flashcard.transform = CGAffineTransform.identity
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            //Storing the first question in our array.
            updateFlashcard(question: "What is the capital city of Ethiopia?", answer: "Addis Abeba", extraAnswerone: "Hawassa", extraAnswertwo: "Khartoum", isExisting: false)
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
        
        // Do any additional setup after loading the view.
        Frontlabel.layer.cornerRadius = 20.0
        Frontlabel.clipsToBounds = true
        
        Backlabel.layer.cornerRadius = 20.0
        Backlabel.clipsToBounds = true
        
        optionOne.layer.borderWidth = 3.0
        optionOne.layer.borderColor = #colorLiteral(red: 0, green: 0.5625661612, blue: 0.3010617495, alpha: 1)
        optionOne.layer.cornerRadius = 20.0
        
        optionTwo.layer.borderWidth = 3.0
              optionTwo.layer.borderColor = #colorLiteral(red: 0, green: 0.5625661612, blue: 0.3010617495, alpha: 1)
              optionTwo.layer.cornerRadius = 20.0
        optionThree.layer.borderWidth = 3.0
              optionThree.layer.borderColor = #colorLiteral(red: 0, green: 0.5625661612, blue: 0.3010617495, alpha: 1)
              optionThree.layer.cornerRadius = 20.0
     
        Flashcard.layer.cornerRadius = 20.0
            Flashcard.layer.shadowRadius = 15.0
            Flashcard.layer.shadowOpacity = 0.7
            Flashcard.layer.shadowColor = UIColor.blue.cgColor
           

             
             optionOne.layer.borderWidth = 3.0
             optionOne.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            optionOne.layer.cornerRadius = 20.0
             
             
             optionTwo.layer.borderWidth = 3.0
             optionTwo.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
             optionTwo.layer.cornerRadius = 20.0
               
             
             
             optionThree.layer.borderWidth = 3.0
             optionThree.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
             optionThree.layer.cornerRadius = 20.0
              
        
     
    
     
             DeleteButton.layer.cornerRadius = 10.0
        editButton.layer.cornerRadius = 10.0
        
    }
    
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        flipFlashcard()

    }
    func flipFlashcard(){
        UIView.transition(with: Flashcard, duration: 0.3, options: .transitionFlipFromRight, animations: {
            if self.Frontlabel.isHidden {
                self.Backlabel.isHidden = true
                self.Frontlabel.isHidden = false
            }
            else {
                self.Frontlabel.isHidden = true
                self.Backlabel.isHidden = false
            }

            
        })
//        if Frontlabel.isHidden {
//            Backlabel.isHidden = true
//            Frontlabel.isHidden = false
//        }
//        else {
//            Frontlabel.isHidden = true
//            Backlabel.isHidden = false
//        }
    }
    
    
    @IBAction func didTaponAnswer(_ sender: Any) {
        Frontlabel.isHidden = true
        Backlabel.isHidden = false
        
    }
    
    
    @IBAction func didTaponOptionone(_ sender: Any) {
        optionOne.isHidden = true
    }
    
    
    @IBAction func didTapOnOptionThree(_ sender: Any) {
        optionThree.isHidden = true
    }
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
      //Increase the current index
        CurrentIndex = CurrentIndex + 1
        //update labels
        updateLabels()
        
        //update button
        updateNextPrevButtons()
        //animation
        animateCardOut()
         
        //to make the options reapper incase the user gets the answers wrong the previous flash card
        optionOne.isHidden = false
         optionThree.isHidden = false
        Frontlabel.isHidden = false
    }
    
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
            //Decrease the current index
        CurrentIndex = CurrentIndex - 1
        //update labels
        updateLabels()
         //update button
        
        
        
        Frontlabel.isHidden = false
        updateNextPrevButtons()
        //to make the options reapper incase the user gets the answers wrong the previous flash card
              optionOne.isHidden = false
               optionThree.isHidden = false
        
    }
    func animateCardOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.Flashcard.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        }, completion: { finished in
            self.animateCardIn()
            self.updateLabels()
        })
    }
    func animateCardIn(){
           Flashcard.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        UIView.animate(withDuration: 0.3){
            self.Flashcard.transform = CGAffineTransform.identity
        }
    }
    

    @IBAction func didTaponDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        present(alert, animated: true)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.deleteCurrentFlashcard()
        }
       
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
     
        
    }
    
    func deleteCurrentFlashcard(){
        //delete current flashcard
        flashcards.remove(at: CurrentIndex)
        print("Current Flashcard deleted")
        print("There are now \(flashcards.count) flashcards")
        
        if CurrentIndex > flashcards.count - 1 {
            CurrentIndex = flashcards.count - 1
        }
        if flashcards.count == 1{
            DeleteButton.isEnabled = false
        }
        updateNextPrevButtons()
        updateLabels()
        SaveAllFlashcardsToDisk()
    }
    
    
    
    
    //double check if warning arise.
    func updateFlashcard(question: String, answer:String, extraAnswerone: String?, extraAnswertwo: String?, isExisting:Bool){
        let flashcard = Flashcardd(question: question, answer: answer, optionone: extraAnswerone!, optiontwo: extraAnswertwo!, extraAnswerone: extraAnswerone!, extraAnswertwo: extraAnswertwo!)
        if isExisting {
            flashcards[CurrentIndex] = flashcard
            //update buttons
             updateNextPrevButtons()
             //update labels
             updateLabels()
             
            
             updateNextPrevButtons()
             
        }
        else {
            //Adding Flashcardd in the flashcards array
                flashcards.append(flashcard)
             // Logging to the console
                    print("Added a new flashcard")
                    print("There are now \(flashcards.count) flashcards")
                    //update current index
                    CurrentIndex = flashcards.count - 1
            print("Our current index is \(CurrentIndex)")
            //update buttons
             updateNextPrevButtons()
             //update labels
             updateLabels()
             
            
             updateNextPrevButtons()
             
            
        }
    
 
        dismiss(animated: true)
        Frontlabel.text = question
        Backlabel.text = answer
        optionOne.setTitle(extraAnswerone, for: .normal)
         optionTwo.setTitle(answer, for: .normal)
        optionThree.setTitle(extraAnswertwo, for: .normal)
        
        
        //save flash cards to user defaults
        SaveAllFlashcardsToDisk()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    
        //creationController.initialQuestion = Frontlabel.text
        //creationController.initialAnswer = Backlabel.text
        if segue.identifier == "EditSegue" {
        creationController.initialQuestion = Frontlabel.text
        creationController.initialAnswer = Backlabel.text
   
            
          }
   
           // creationController.questionTextField.text = Frontlabel.text
            // creationController.answerTextField.text = Backlabel.text
    
     
 
     
    }
    func updateNextPrevButtons(){
        //disable next button if at the end
        if CurrentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        //disable prev button if at the start
        if CurrentIndex != 0 {
            prevButton.isEnabled = true
            
        }
        else {
            prevButton.isEnabled = false
        }
    }

    
   func SaveAllFlashcardsToDisk() {
    //since it can't directly store the array we need to create a dictionary of arrays
   // Convert From flashcard array to dictionary
    let dictionaryarray = flashcards.map{ (card) -> [String: String] in return ["question": card.question,"answer": card.answer, "option One": card.optionone, "option Two" : card.optiontwo,"extraAnswerone":card.extraAnswerone,"extraAnswertwo": card.extraAnswertwo]
    }
    
    
        //saving array on disk using UserDefaults
    UserDefaults.standard.set(dictionaryarray, forKey: "flashcards")
    
    //Log it
    print("Flashcard saved")
        
    }
    func readSavedFlashcards() {
       //Read dictionary array from disk(incase there's any)
        if let dictionaryarray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
       //Now we know for sure that there is a a dictionary array
            let savedCards = dictionaryarray.map { dictionary -> Flashcardd in return                Flashcardd(question: dictionary["question"]!, answer: dictionary["answer"]!, optionone: dictionary["option One"]!, optiontwo: dictionary["option Two"]!, extraAnswerone: dictionary["extraAnswerone"]!,extraAnswertwo: dictionary["extraAnswertwo"]!)
                //Flashcardd(question: dictionary["question"]!, answer: dictionary["answer"]!, optionone: dictionary["option One"]!, optiontwo: dictionary["option Two"]!)
                
            }
            //Put all of these cards in our flash cards array
            flashcards.append(contentsOf: savedCards)
            
        }
    }
    
    
    
    
    
    
    func updateLabels() {
        //Get current flashcard
        let currentFlashcard = flashcards[CurrentIndex]
        //update labels
        Frontlabel.text = currentFlashcard.question
        Backlabel.text = currentFlashcard.answer
        optionOne.setTitle(currentFlashcard.extraAnswerone, for: .normal)
        optionTwo.setTitle(currentFlashcard.answer, for: .normal)
         optionThree.setTitle(currentFlashcard.extraAnswertwo, for: .normal)
        
    }

  
    

    
        
    }

    


