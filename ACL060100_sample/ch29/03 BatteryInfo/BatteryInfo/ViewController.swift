//
//  ViewController.swift
//  BatteryInfo
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        
        // 取得目前電力, 如果得到 -1.0，代表未開啟電池狀態監視
        print("電力: \(device.batteryLevel)")

        // 取得電池狀態
        switch device.batteryState {
        case .charging:
            print("充電中")
            
        case .full:
            print("電力全滿")
            
        case .unplugged:
            print("未充電")
            
        case .unknown:
            print("未知")
            
        @unknown default:
            fatalError()
        }

    }


}

