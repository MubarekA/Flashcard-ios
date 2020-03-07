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
    
    func updateFlashcard(question: String, answer:String){
        dismiss(animated: true)
        Frontlabel.text = question
        Backlabel.text = answer
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }

    
}

