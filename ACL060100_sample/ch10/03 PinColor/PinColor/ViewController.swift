//
//  ViewController.swift
//  PinColor
//
//  Created by KoKang Chu on 2019/7/16.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let anns = [MKPointAnnotation(), MKPointAnnotation()]
        anns[0].coordinate = CLLocationCoordinate2D(latitude: 24.137426, longitude:
            121.275753)
        anns[0].title = "武嶺"
        anns[0].subtitle = "南投縣仁愛鄉（綠色）"
        
        anns[1].coordinate = CLLocationCoordinate2D(latitude: 23.510041, longitude:
            120.700458)
        anns[1].title = "奮起湖"
        anns[1].subtitle = "嘉義縣竹崎鄉（澄色）"
        
        mapView.addAnnotations(anns)
        
        // 移動地圖
        mapView.setCenter(anns[0].coordinate, animated: false)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            // 如果標記是使用者所在位置，不可以做任何處理
            return nil
        }

        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKPinAnnotationView
        if annView == nil {
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier:
                "pin")
        }
        
        if (annotation.title)! == "武嶺" {
            annView!.pinTintColor = UIColor.green
        }
        else if (annotation.title)! == "奮起湖" {
            annView!.pinTintColor = UIColor.orange
        }
        
        // 點大頭針後顯示標示
        annView!.canShowCallout = true
        
        return annView
    }
}

