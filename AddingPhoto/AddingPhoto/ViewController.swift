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
        
        //Keyboard
        MessageTextField.keyboardAppearance = .dark
        let bottomSwipe = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        bottomSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(bottomSwipe)
        
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    //Photo
    func takeFhotoLibrary() {
        imagePicker =  UIImagePickerController() //экземпляр imagePicker
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate //delegate
        imagePicker.sourceType = .photoLibrary //type imagePicker
        present(imagePicker, animated: true, completion: nil) //покзать imagePicker на экране при нажатии на кнопку
    }
    
    func takeFhotoCamera() {
        imagePicker =  UIImagePickerController() //экземпляр imagePicker
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate //delegate
        imagePicker.sourceType = .camera //type imagePicker
        present(imagePicker, animated: true, completion: nil) //покзать imagePicker на экране при нажатии на кнопку
    }
    
    //MARK: - Take Image
    @IBAction func addingPhoto(_ sender: Any) {
        let choice = UIAlertController(title: "Please make a selection", message: "Camera or Library?", preferredStyle: .actionSheet)
        choice.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
            self.takeFhotoCamera()
        }))
        choice.addAction(UIAlertAction(title: "Library", style: .default, handler: { (_) in
            self.takeFhotoLibrary()
        }))
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        choice.addAction(cancel)
        present(choice, animated: true)
    }
    
    
    //MARK: - Done image capture here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil) //?
        imageTake.image = info[UIImagePickerControllerOriginalImage] as? UIImage //добавление выбранной картинки в imageView
    }
    
    
}
