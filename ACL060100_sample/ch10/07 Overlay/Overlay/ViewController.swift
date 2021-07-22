//
//  ViewController.swift
//  Overlay
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
        var points = [CLLocationCoordinate2D]()
        points.append(CLLocationCoordinate2D(latitude: 24.2013, longitude: 120.5810))
        points.append(CLLocationCoordinate2D(latitude: 24.2044, longitude: 120.6559))
        points.append(CLLocationCoordinate2D(latitude: 24.1380, longitude: 120.6401))
        points.append(CLLocationCoordinate2D(latitude: 24.1424, longitude: 120.5783))
        
        let polygon = MKPolygon(coordinates: &points, count: points.count)
        mapView.addOverlay(polygon)
        
        // 移動地圖
        mapView.setCenter(points[0], animated: false)
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolygonRenderer(overlay: overlay)
        
        if overlay is MKPolygon {
            // 設定範圍內塗滿的顏色
            render.fillColor = UIColor.red.withAlphaComponent(0.2)
            
            // 設定畫筆顏色
            render.strokeColor = UIColor.red.withAlphaComponent(0.7)
            
            // 設定線條粗細
            render.lineWidth = 3
        }
        
        return render
    }

}

