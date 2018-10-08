//
//  ViewController.swift
//  TipCalculator
//
//  Created by Alexandr Yanski on 08.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var enterMoney: UITextField!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var percentLabelResult: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enterMoney.delegate = self
        
        //Placeholder
        enterMoney.placeholder = "$0.00"
        
        //Done button
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneCklicked))
        toolBar.setItems([doneButton], animated: false)
        enterMoney.inputAccessoryView = toolBar
        
        //Type of keyboard
        self.enterMoney.keyboardType = .decimalPad
        
        //Slider
        self.percentSlider.minimumValue = 0.0
        self.percentSlider.maximumValue = 100.0
        self.percentSlider.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        
    }
    
    var numberTextField: Float = 0.00
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let textFieldText = enterMoney.text {
            if let floatTextFieldText = Float(textFieldText) {
                numberTextField = floatTextFieldText
            }
            self.enterMoney.text = "$\(String(describing: textFieldText))"
        }
    }
    
    @objc func doneCklicked() {
        view.endEditing(true)
    }
    
    @objc func changeSlider(sender: UISlider) {
        if sender == percentSlider {
            percentLabel.text = "Tip (\(Int(sender.value))%)"
            let firstLabel = roundFloat(x: ((Float(sender.value) * numberTextField) / 100))
            let secondLabel = firstLabel + numberTextField
            percentLabelResult.text = "$\(String(firstLabel))"
            totalLabel.text = "$\(String(secondLabel))"
        }
    }
    
    func roundFloat(x: Float) -> Float {
        let y = Float(round(100 * x) / 100)
        return y
    }
    
}


