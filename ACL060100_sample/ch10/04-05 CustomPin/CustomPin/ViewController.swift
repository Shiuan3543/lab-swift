//
//  ViewController.swift
//  CustomPin
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
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: 24.120305, longitude: 120.650916)
        mapView.addAnnotation(ann)
        
        // 移動地圖
        mapView?.setCenter(ann.coordinate, animated: false)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
        if annView == nil {
            annView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        }
        
        annView!.image = UIImage(named: "coffee_to_go")
        // 允許使用者可以拖放大頭針
        annView!.isDraggable = true

        return annView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.removeAnnotation(view.annotation!)
    }

}

