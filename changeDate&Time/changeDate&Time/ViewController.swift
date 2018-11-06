//
//  ViewController.swift
//  ChangeDate&Time
//
//  Created by Alexandr Yanski on 03.11.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PassDataDelegate {
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func passData(value: String) {
        self.dateTimeLabel.text = value
    }

    @IBAction func changeDate(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangeDateID") as! ChangeDateViewController
        vc.delegate = self
        let navigationController: UINavigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

