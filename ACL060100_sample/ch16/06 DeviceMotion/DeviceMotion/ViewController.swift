//
//  ViewController.swift
//  DeviceMotion
//
//  Created by KoKang Chu on 2019/7/10.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let mm = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mm.showsDeviceMovementDisplay = true
        mm.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: OperationQueue()) { (motion, error) in
            if let motion = motion {
                // 裝置目前的姿勢
                let attitude = motion.attitude
                print("姿勢：\(attitude.pitch), \(attitude.roll), \(attitude.yaw)")
                
                // 三軸的轉動弧度
                let rotation = motion.rotationRate
                print("轉動弧度：\(rotation.x), \(rotation.y), \(rotation.z)")
                
                // 三軸方向的重力加速度
                let gravity = motion.gravity
                print("含重力加速度：\(gravity.x), \(gravity.y), \(gravity.z)")
                
                // 三軸方向的加速度，不包含重力加速度
                let acceleration = motion.userAcceleration
                print("不含重力加速度：\(acceleration.x), \(acceleration.y), \(acceleration.z)")
                
                // 三軸方向的磁場強度
                let magnetic = motion.magneticField
                print("磁場：\(magnetic.field.x), \(magnetic.field.y), \(magnetic.field.z)")
            }
        }
    }


}

