//
//  AppDelegate.swift
//  Plist
//
//  Created by KoKang Chu on 2019/7/18.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let fm = FileManager.default
        
        // 取得 Property List.plist 在專案中的路徑
        let src = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        // 取得要複製到的目的路徑
        let dst = NSHomeDirectory() + "/Documents/Property List.plist"
        
        // 檢查目的路徑的 Property List.plist 檔案是否已經存在，如果不存在則複製檔案
        if !fm.fileExists(atPath: dst) {
            try! fm.copyItem(atPath: src!, toPath: dst)
        }

        return true
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

