//
//  ChangeDateViewController.swift
//  ChangeDate&Time
//
//  Created by Alexandr Yanski on 03.11.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

protocol PassDataDelegate: class {
    func passData(value: String)
}

class ChangeDateViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var todayLabel: UILabel!
    
    let viewController = ViewController()
    weak var delegate: PassDataDelegate?
    let nowDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        todayLabel.text = "Today is: \(dateFormatter.string(from: nowDate))"
        
        let backButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelEditor))
        self.navigationItem.setLeftBarButton(backButton, animated: false)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:  #selector(finishEditing))
    }
    
    
    @objc func finishEditing() {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        timeFormatter.dateFormat = "h:mm a"
        let currentDate = dateFormatter.string(from: datePicker.date)
        let currentTime = timeFormatter.string(from: timePicker.date)
        let data = "\(currentDate), \(currentTime)"
        delegate?.passData(value: data)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelEditor() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy, h:mm a"
        let nowDateData = dateFormatter.string(from: nowDate)
        delegate?.passData(value: nowDateData)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }


}
