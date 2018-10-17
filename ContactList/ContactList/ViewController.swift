//
//  ViewController.swift
//  ContactList
//
//  Created by Alexandr Yanski on 10.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var notesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactPhoto.layer.cornerRadius = self.contactPhoto.bounds.size.width / 2.0
        self.contactPhoto.clipsToBounds = true
        self.contactPhoto.image = UIImage(named: "AppIcon")
    }
    
    override func viewDidLayoutSubviews() {
        self.notesLabel.sizeToFit()
    }



}

