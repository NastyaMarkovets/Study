//
//  ViewController.swift
//  GettingCurrentDate&Time
//
//  Created by Alexandr Yanski on 08.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTimeLabel.text = getDate()
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        
        dateTimeLabel.text = getDate()
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy, HH:mm:ss"
        
        let todayDate: Date = Date()
        let date = dateFormatter.string(from: todayDate)
        return date
    }
    
}
