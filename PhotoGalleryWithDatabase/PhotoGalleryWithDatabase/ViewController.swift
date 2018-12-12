//
//  ViewController.swift
//  PhotoGalleryWithDatabase
//
//  Created by Alexandr Yanski on 13.11.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionPhoto: UICollectionView!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    let photoInformationModel = PhotoInformationModel()
    let realm = try! Realm() //Доступ к хранилищу
    var herosItems: Results<PhotoInformationModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.basicElements()
        
        self.herosItems = realm.objects(PhotoInformationModel.self)
        
        self.collectionPhoto.delegate = self
        self.collectionPhoto.dataSource = self
        
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        collectionPhoto.register(nib, forCellWithReuseIdentifier: "cell")
        
        self.sizeCollectionViewCell()
    }
    
    func basicElements() {
        let deadpoolItem = PhotoInformationModel(value: [convertImageToData(pic: "deadpool"), "Deadpool", 15,
                                                         "Deadpool (Wade Winston Wilson) is a fictional character appearing in American comic books published by Marvel Comics. Initially Deadpool was depicted as a supervillain when he made his first appearance in The New Mutants and later in issues of X-Force, but later evolved into his more recognizable antiheroic persona. Deadpool, whose real name is Wade Wilson, is a disfigured mercenary with the superhuman ability of an accelerated healing factor and physical prowess.", "#deadpool #superhero"])
        let ironManItem = PhotoInformationModel(value: [convertImageToData(pic: "IronMan"), "IronMan", 20,
                                                        "Iron Man is a fictional superhero appearing in American comic books published by Marvel Comics. The character was co-created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby.", "#ironman #superhero"])
        try! realm.write {
            realm.add([deadpoolItem, ironManItem])
        }
        //try! realm.de
    }
    
    func convertImageToData(pic: String) -> Data? {
        let profileImage = UIImage(named: pic)
        let imageData = UIImagePNGRepresentation(profileImage!)
        return imageData
    }
    
    func sizeCollectionViewCell() {
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        self.layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        self.layout.minimumInteritemSpacing = 0
        self.layout.minimumLineSpacing = 0
        self.collectionPhoto.collectionViewLayout = layout
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0
        {
            return CGSize(width: screenWidth, height: screenWidth/3)
        }
        return CGSize(width: screenWidth/3, height: screenWidth/3)
        
    }
    
    // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if herosItems.count != 0 {
            return herosItems.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
        let item = herosItems[indexPath.row]
        if let imageData = item.picture {
            cell.cellImageView.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }

//    // MARK: - Load photo
//    @IBAction func addingPhoto(_ sender: Any) {
//        let choice = UIAlertController(title: "Please make a selection", message: "Camera or Library?", preferredStyle: .actionSheet)
//        choice.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
//            self.takeFhotoCamera()
//        }))
//        choice.addAction(UIAlertAction(title: "Library", style: .default, handler: { (_) in
//            self.takeFhotoLibrary()
//        }))
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        choice.addAction(cancel)
//        present(choice, animated: true)
//    }
//
//    func takeFhotoLibrary() {
//        imagePicker =  UIImagePickerController() //экземпляр imagePicker
//        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate //delegate
//        imagePicker.sourceType = .photoLibrary //type imagePicker
//        present(imagePicker, animated: true, completion: nil) //покзать imagePicker на экране при нажатии на кнопку
//    }
//
//    func takeFhotoCamera() {
//        imagePicker =  UIImagePickerController() //экземпляр imagePicker
//        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate //delegate
//        imagePicker.sourceType = .camera //type imagePicker
//        present(imagePicker, animated: true, completion: nil) //покзать imagePicker на экране при нажатии на кнопку
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        self.items.append(info[UIImagePickerControllerOriginalImage] as! UIImage) //добавление выбранной картинки в массив
//        self.collectionPhoto.reloadData()
//    }



}

