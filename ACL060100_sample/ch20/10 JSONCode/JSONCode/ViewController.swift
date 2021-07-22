//
//  ViewController.swift
//  JSONCode
//
//  Created by KoKang Chu on 2019/8/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

struct AQI: Codable {
//    enum CodingKeys : String, CodingKey {
//        case county = "County"
//        case sitename = "SiteName"
//        case aqi = "AQI"
//    }
    
    var County: String
    var SiteName: String
    var AQI: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json")
        let data = try! Data(contentsOf: url!)
        let aqi = try! JSONDecoder().decode([AQI].self, from: data)
        aqi.forEach { (p) in
            print(p)
        }
    }
}

