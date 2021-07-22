//
//  ViewController.swift
//  Addr2Coord
//
//  Created by KoKang Chu on 2019/7/16.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let request = MKLocalSearch.Request()
        // 可輸入地址或是關鍵字
        request.naturalLanguageQuery = "台北故宮博物院"
        // 這一行必須等地圖出現後才能得到正確的region資料
        request.region = mapView.region
        MKLocalSearch(request: request).start { (response, error) in
            guard error == nil, response != nil else {
                return
            }
            
            for item in response!.mapItems {
                self.mapView.addAnnotation(item.placemark)
                // 移動地圖
                self.mapView.setCenter(item.placemark.coordinate, animated: false)
            }
        }

    }


}

