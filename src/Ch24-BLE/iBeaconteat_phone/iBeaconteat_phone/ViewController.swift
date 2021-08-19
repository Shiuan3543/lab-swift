//
//  ViewController.swift
//  iBeaconteat_phone
//
//  Created by 井民全 on 2021/7/23.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        guard peripheral.state == .poweredOn else {
            print("Bluetooth have not power on")
            return
        }
        peripheral.delegate = self
        
        
    }
    

    var periphralManager: CBPeripheralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let queue = DispatchQueue.global()
        peripheralManager = CBPeripheralManager(delegate: self, queue: queue)
    }


}

