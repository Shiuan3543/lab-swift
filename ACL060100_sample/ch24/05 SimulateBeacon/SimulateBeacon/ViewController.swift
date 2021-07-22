//
//  ViewController.swift
//  SimulateBeacon
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    var peripheralManager: CBPeripheralManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let queue = DispatchQueue.global()
        peripheralManager = CBPeripheralManager(delegate: self, queue: queue)
    }

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        guard peripheral.state == .poweredOn else {
            print("藍牙未開啟")
            return
        }
        
        peripheral.delegate = self
        
        // uuid可在終端機由uuidgen指令產生
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        // 雖然identifier參數在這裡沒有用處，但不可以填nil
        let region = CLBeaconRegion(
            uuid: uuid!,
            major: 12300,
            minor: 23,
            identifier: ""
        )
        
        var advData = [String: Any]()
        for (key, value) in region.peripheralData(withMeasuredPower: nil) {
            advData[key as! String] = value
        }
        
        // mybeacon是當某裝置進行掃描周圍藍牙裝置時會看到的名字
        advData[CBAdvertisementDataLocalNameKey] = "mybeacon"
        // 開始廣播訊號
        peripheral.startAdvertising(advData)
    }

}

