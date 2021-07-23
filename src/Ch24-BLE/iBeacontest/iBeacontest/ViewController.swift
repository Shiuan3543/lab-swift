//
//  ViewController.swift
//  iBeacontest
//
//  Created by 井民全 on 2021/7/23.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let CLLM = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CLLM.requestWhenInUseAuthorization()
        CLLM.requestAlwaysAuthorization()
        CLLM.delegate = self
        
        //欲偵測beacon的UUID
        let uuid = UUID(uuidString: "aaed7beed70e91d20ec3858c5a40dd1c5772dd3c")
        let region = CLBeaconRegion(uuid: uuid!, identifier: "imediplustestiphone8")
        
        //得知附近beacon的資訊
        //觸發No.1
        CLLM.startRangingBeacons(satisfying: region.beaconIdentityConstraint)
        
        //接收進入或離開區域的通知
        //觸發No.2 and No.3
        CLLM.startMonitoring(for: region)
    }
    //No.1
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            print("major = \(beacon.major)" + "\n" + "minor = \(beacon.minor)" + "\n" + "accury = \(beacon.accuracy)" + "\n" + "rssi = \(beacon.rssi)")
            switch beacon.proximity {
            case .far:
                print("beacon距離遠")
            case .near:
                print("beacon距離近")
            case .immediate:
                print("beacon在旁邊")
            case .unknown:
                print("窩不知道")
            @unknown default:
                break
            }
        }
    }
    //No.2
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //進入區域
        print("Enter \(region.identifier)")
    }
    //No.3
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        //離開區域
        print("Exit \(region.identifier)")
    }
}

