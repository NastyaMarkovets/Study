//
//  ViewController.swift
//  PassingDataToAnotherView
//
//  Created by Alexandr Yanski on 08.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MessageTextField: UITextField!
    var takeMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SentMessage(_ sender: Any) {
        if let value = MessageTextField.text {
            self.takeMessage = value
            performSegue(withIdentifier: "sendText", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController {
            vc.takeMessage = self.takeMessage
        }
    }
    
}



