//
//  ViewController.swift
//  AddingPhoto
//
//  Created by Alexandr Yanski on 08.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet weak var imageTake: UIImageView!
    @IBOutlet weak var MessageTextField: UITextField!
    var imagePicker: UIImagePickerController!
    
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
    
}
