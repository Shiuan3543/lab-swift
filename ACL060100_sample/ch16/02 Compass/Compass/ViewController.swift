//
//  ViewController.swift
//  Compass
//
//  Created by KoKang Chu on 2019/7/10.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let lm = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lm.delegate = self
        lm.startUpdatingHeading()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading:
        CLHeading) {
        if newHeading.headingAccuracy < 0 {
            print("請進行校正並遠離磁性干擾源")
        } else {
            print("目前面向 \(newHeading.magneticHeading)")
        }
    }
}

