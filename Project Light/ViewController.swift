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
    var isOn = false {
        didSet {
            updateUI()
        }
    }
    @IBAction func buttonPress() {
        isOn = !isOn
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateUI()
        let image = UIImage(named: "buttonOn")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(imageView)
        imageView.layer.cornerRadius = 24
        imageView.clipsToBounds = true
        imageView.center = self.view.center
        imageView.contentMode = .scaleAspectFit
        
//        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        image.height.constraint(equalToConstant: 72).isActive = true
//        image.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 147).isActive = true
//        image.topAnchor.constraint(equalTo: parent.topAnchor, constant: 100).isActive = true
        
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
            let image = UIImage(named: "buttonOff")
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            view.addSubview(imageView)
            imageView.layer.cornerRadius = 24
            imageView.clipsToBounds = true
            imageView.center = self.view.center
            imageView.contentMode = .scaleAspectFit
        } else {
            view.backgroundColor = .black
            let image = UIImage(named: "buttonOn")
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            view.addSubview(imageView)
            imageView.layer.cornerRadius = 24
            imageView.clipsToBounds = true
            imageView.center = self.view.center
            imageView.contentMode = .scaleAspectFit
        }
        
    }




}
