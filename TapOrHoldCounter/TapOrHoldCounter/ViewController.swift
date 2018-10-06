//
//  ViewController.swift
//  TapOrHoldCounter
//
//  Created by Alexandr Yanski on 06.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func holdButton(_ sender: Any) {
        if let number = Int(self.numberLabel.text!) {
            self.numberLabel.text = String(number + 1)
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        if let number = Int(self.numberLabel.text!) {
            if number != 0 {
                self.numberLabel.text = "0"
            }
        }
    }
}

