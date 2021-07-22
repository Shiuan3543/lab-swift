//
//  ViewController.swift
//  GPS
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
        lm.requestWhenInUseAuthorization()
        lm.requestAlwaysAuthorization()
        lm.allowsBackgroundLocationUpdates = true
        lm.delegate = self
        lm.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("緯度: \(location.coordinate.latitude)")
            print("經度: \(location.coordinate.longitude)")
            print("高度: \(location.altitude)")
        }

    }
}

