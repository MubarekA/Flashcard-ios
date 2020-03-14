//
//  ViewController.swift
//  Flashcardapp2
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Mubareka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Flashcard: UIView!
    
    @IBOutlet weak var Backlabel: UILabel!
    
    @IBOutlet weak var Frontlabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    @IBOutlet weak var optionThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                 
             
        
        
        
    }
    
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if Frontlabel.isHidden {
            Backlabel.isHidden = true
            Frontlabel.isHidden = false
        }
        else {
            Frontlabel.isHidden = true
            Backlabel.isHidden = false
        }
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
    
    
    
    
    
    func updateFlashcard(question: String, answer:String, extraAnswerone: String?, extraAnswertwo: String?){
        dismiss(animated: true)
        Frontlabel.text = question
        Backlabel.text = answer
        optionOne.setTitle(extraAnswerone, for: .normal)
         optionTwo.setTitle(answer, for: .normal)
        optionThree.setTitle(extraAnswertwo, for: .normal)
        
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

    
}

