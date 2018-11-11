//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Alexandr Yanski on 11.11.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var collectionPhoto: UICollectionView!
    var imagePicker: UIImagePickerController!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var items = [UIImage]()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionPhoto.delegate = self
        self.collectionPhoto.dataSource = self
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        self.layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        self.layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        self.layout.minimumInteritemSpacing = 0
        self.layout.minimumLineSpacing = 0
        self.collectionPhoto.collectionViewLayout = layout
    }
    
    // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.cellImage.image = self.items[indexPath.item]
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0
        {
            return CGSize(width: screenWidth, height: screenWidth/3)
        }
        return CGSize(width: screenWidth/3, height: screenWidth/3);
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
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
        imagePicker.dismiss(animated: true, completion: nil)
        self.items.append(info[UIImagePickerControllerOriginalImage] as! UIImage) //добавление выбранной картинки в массив
        self.collectionPhoto.reloadData()
    }
    


}

