//
//  ViewController.swift
//  Flashcardapp2
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Mubareka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Backlabel: UILabel!
    
    @IBOutlet weak var Frontlabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    @IBOutlet weak var optionThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

