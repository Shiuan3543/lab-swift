//
//  ViewController.swift
//  PushNotification
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().delegate = self
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 得知是哪個推播
        print(notification.request.identifier)
        // 若前景也要顯示訊息框，執行以下程式碼即可
        completionHandler([.alert])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response.notification.request.content.categoryIdentifier)
        print(response.actionIdentifier)
        if response.actionIdentifier == "a4" {
            // a4 允許使用者可以回覆訊息
            // 以下印出回覆的訊息
            if let r = response as? UNTextInputNotificationResponse {
                print(r.userText)
            }
        }
    }
}

