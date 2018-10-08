//
//  ViewController.swift
//  SwipeToDismissKeyboard
//
//  Created by Alexandr Yanski on 08.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MessageTextField: UITextField!
    var takeMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MessageTextField.keyboardAppearance = .dark
        
        
        let bottomSwipe = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        bottomSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(bottomSwipe)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func SentMessage(_ sender: Any) {
        if let value = MessageTextField.text {
            self.takeMessage = value
            performSegue(withIdentifier: "sentText", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController {
            vc.takeMessage = self.takeMessage
        }
    }
    
    
}

