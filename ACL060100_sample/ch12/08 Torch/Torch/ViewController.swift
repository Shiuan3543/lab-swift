//
//  ViewController.swift
//  Torch
//
//  Created by KoKang Chu on 2019/7/18.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func torchToggle(_ sender: UISwitch) {
        if let device = AVCaptureDevice.default(for: .video) {
            // device 為後置廣角鏡頭
            if device.hasTorch {
                // 確認後置廣角鏡頭支援火炬功能
                do {
                    // 控制 LED 亮滅
                    try device.lockForConfiguration()
                    if sender.isOn {
                        device.torchMode = .on
                    } else {
                        device.torchMode = .off
                    }
                    device.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

