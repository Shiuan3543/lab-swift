//
//  ViewController.swift
//  Notify
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(receiveNotification(_:)),
            name:  UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }

    @objc func receiveNotification(_ notificaton: Notification) {
        let device = UIDevice.current
        switch device.orientation {
        case .faceUp:
            print("手機面朝上")
            
        case .faceDown:
            print("手機面朝下")
            
        case .portraitUpsideDown:
            print("手機上下顛倒時，取消訊息通知")
            NotificationCenter.default.removeObserver(
                self,
                name: UIDevice.orientationDidChangeNotification,
                object: nil
            )

        default:
            break
        }
    }
}

