//
//  ViewController.swift
//  UISlider
//
//  Created by Alexandr Yanski on 31.08.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var sliderBoard: UISlider!
    
    var player = AVAudioPlayer()
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        self.slider.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        //self.slider.addTarget(self, action: #selector(<#T##@objc method#>), for: .)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "09 Fly", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        self.player.play()
    }

    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(Int(sender.value))
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    
    @IBAction func sliderAction(_ sender: Any) {
        self.player.volume = self.sliderBoard.value
    }
    

}

