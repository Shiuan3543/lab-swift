//
//  ViewController.swift
//  Accelerometer
//
//  Created by KoKang Chu on 2019/7/10.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let mm = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mm.startAccelerometerUpdates(to: OperationQueue()) { (data, error) in
            if let data = data {
                let tmp = data.acceleration
                print("(x, y, z) = (\(tmp.x), \(tmp.y), \(tmp.z))")
            }
        }
    }


}

