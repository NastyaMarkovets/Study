//
//  ViewController.swift
//  project12
//
//  Created by Alexandr Yanski on 04.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit
protocol PassDataDelegate {
    func passData(value: String)
}
class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var enterMovieTextField: UITextField!
    let tableViewController = TableViewController()
    var delegate: PassDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.enterMovieTextField.delegate = self
        
        self.enterMovieTextField.keyboardAppearance = .dark
        
        let bottomSwipe = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        bottomSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(bottomSwipe)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = self.enterMovieTextField.text {
            delegate?.passData(value: text)
            
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
        return false
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}

