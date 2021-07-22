//
//  AppDelegate.swift
//  PushNotification
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted,
            error) in
            if granted {
                center.setNotificationCategories(self.setCategories())
                self.sendNotification()
            } else {
                print("使用者未授權")
            }
        }

        return true
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "c1"
        content.title = "推播測試"
        content.body = "Hello"
        content.badge = 3
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "myid", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }

    func setCategories() -> Set<UNNotificationCategory> {
        var set = Set<UNNotificationCategory>()
        
        let a1 = UNNotificationAction(
            identifier: "a1",
            title: "按鈕1",
            options: []
        )
        let a2 = UNNotificationAction(
            identifier: "a2",
            title: "按鈕2",
            options: [.foreground]
        )
        let a3 = UNNotificationAction(
            identifier: "a3",
            title: "按鈕3",
            options: [.destructive, .authenticationRequired]
        )
        let a4 = UNTextInputNotificationAction(
            identifier: "a4",
            title: "回覆",
            options: []
        )
        
        let c1 = UNNotificationCategory(
            identifier: "c1",
            actions: [a1, a2, a3, a4],
            intentIdentifiers: [],
            options: []
        )
        
        set.insert(c1)
        
        return set
    }

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

