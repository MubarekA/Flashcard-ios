//
//  CreationViewController.swift
//  Flashcardapp2
//
//  Created by mac on 3/7/20.
//  Copyright © 2020 Mubareka. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    

    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var extraAnswerone: UITextField!
    
    
    @IBOutlet weak var extraAnswertwo: UITextField!
    
   
    var initialQuestion: String?
    var initialAnswer: String?
    
    
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer 

        // Do any additional setup after loading the view.
    }
   
    
    
    
    

    @IBAction func didTaponcancel(_ sender: Any) {
         dismiss(animated: true)
    }
    
 
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let answerone = extraAnswerone.text
        let answertwo = extraAnswertwo.text
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty || extraAnswerone == nil || extraAnswertwo == nil  {
            let alert = UIAlertController(title: "Missing test", message: "You need to enter both a question and answer", preferredStyle: .alert)
            present(alert,animated: true)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        }
        else {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerone: answerone!,extraAnswertwo: answertwo!)
        
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
}
