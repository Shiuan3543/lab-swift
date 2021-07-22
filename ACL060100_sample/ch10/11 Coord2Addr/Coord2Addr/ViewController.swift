//
//  ViewController.swift
//  Coord2Addr
//
//  Created by KoKang Chu on 2019/7/16.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import CoreLocation
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 這個位置是台北故宮的座標
        let location = CLLocation(latitude: 25.102645, longitude: 121.548506)
        let geocoder = CLGeocoder()
        
        // 將座標轉換成地址
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard error == nil, placemarks != nil else {
                return
            }
            
            for placemark in placemarks! {
                // 名字
                print(placemark.name!)
                // 國家
                print(placemark.country!)
                // 位置
                print(placemark.locality!)
                // 都市
                print(placemark.postalAddress!.street)
            }
        }
    }
}

