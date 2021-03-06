//
//  ViewController.swift
//  Callout
//
//  Created by KoKang Chu on 2019/7/16.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import MapKit
import SafariServices

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: 24.137426, longitude: 121.275753)
        ann.title = "武嶺"
        mapView.addAnnotation(ann)
        
        // 移動地圖
        mapView.setCenter(ann.coordinate, animated: false)

    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
        if (annView == nil) {
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier:
                "pin")
        }
        
        if (annotation.title)! == "武嶺" {
            // 設定左邊為一張圖片
            // 圖片已經使用影像處理軟體調整為適當的長寬
            let imageView = UIImageView(image: UIImage(named: "wuling.jpg"))
            annView?.leftCalloutAccessoryView = imageView
            
            // 設定title下方放一個標籤
            let label = UILabel()
            label.numberOfLines = 2
            label.text = "緯度:\(annotation.coordinate.latitude)\n經度:\(annotation.coordinate.longitude)"
            annView?.detailCalloutAccessoryView = label
            
            // 設定右邊為一個按鈕
            let button = UIButton(type: .detailDisclosure)
            button.tag = 100
            button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
            
            annView?.rightCalloutAccessoryView = button
        }
        
        annView?.canShowCallout = true
        
        return annView
    }

    @objc func buttonPress(_ sender: UIButton) {
        if sender.tag == 100 {
            let url = URL(string: "http://www.taroko.gov.tw")
            let safari = SFSafariViewController(url: url!)
            show(safari, sender: self)
        }
    }

}

