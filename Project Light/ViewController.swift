//
//  ViewController.swift
//  Project Light
//
//  Created by Кирилл Кибешев on 15.04.2019.
//  Copyright © 2019 Кирилл Кибешев. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    var isOn = true {
        didSet {
            updateUI()
        }
    }
    @IBAction func buttonPress() {
        isOn = !isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
        func updateUI() {
            let device = AVCaptureDevice.default(for: .video)
            if (device?.hasTorch)! {
                do {
                    try device?.lockForConfiguration()
                    if (device?.torchMode == AVCaptureDevice.TorchMode.on) {
                        device?.torchMode = AVCaptureDevice.TorchMode.off
                    } else {
                        do {
                            try device?.setTorchModeOn(level: 1.0)
                        } catch {
                            print(error)
                        }
                    }
                    device?.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
      
        if isOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
        
    }




}
