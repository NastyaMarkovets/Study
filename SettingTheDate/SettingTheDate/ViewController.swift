//
//  ViewController.swift
//  SettingTheDate
//
//  Created by Alexandr Yanski on 03.11.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addDate(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let currentDate = dateFormatter.string(from: self.datePicker.date)
        self.navigationItem.title = currentDate
    }
    

}

