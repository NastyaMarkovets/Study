//
//  ViewController.swift
//  AddArticle
//
//  Created by Alexandr Yanski on 12.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

protocol PassDataDelegate: class {
    func passData(value: cellData)
}

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var addPhoto: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var enterTextField: UITextField!
    
    let tableViewController = TableViewController()
    weak var delegate: PassDataDelegate?
    var imagePicker: UIImagePickerController!
    var namePhoto: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enterTextField.delegate = self
        
        self.dateLabel.text = getDate()
        
        enterTextField.keyboardAppearance = .dark
        let bottomSwipe = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        bottomSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(bottomSwipe)
    }
    
    @IBAction func addingCell(_ sender: Any) {
        if let text = self.enterTextField.text {
            if let image = self.addPhoto.image {
                delegate?.passData(value: cellData(date: getDate(), text: text, image: image))
                
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                }
            }
        }
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    //Date
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        let todayDate: Date = Date()
        let date = dateFormatter.string(from: todayDate)
        return date
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
        self.addPhoto.image = info[UIImagePickerControllerOriginalImage] as? UIImage //добавление выбранной картинки в imageView
    }
    
}

