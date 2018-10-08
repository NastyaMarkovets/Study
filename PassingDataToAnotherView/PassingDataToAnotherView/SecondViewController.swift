//
//  SecondViewController.swift
//  PassingDataToAnotherView
//
//  Created by Alexandr Yanski on 08.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var TakeMessage: UILabel!
    
    var takeMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let message = takeMessage {
            TakeMessage.text = message
        }
    }
    
}

