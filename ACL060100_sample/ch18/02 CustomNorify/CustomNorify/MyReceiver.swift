//
//  MyReceiver.swift
//  CustomNorify
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class MyReceiver: NSObject {
    @objc func receiveNotification(_ notification: Notification) {
        if let n = notification.object as? Int {
            if notification.name.rawValue == "MYKEY" {
                print(n)
            }
        }
    }
}
