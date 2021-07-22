//
//  ViewController.swift
//  ShareWrite
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 共享方式一：檔案共享 - 寫入
        let fm = FileManager.default
        let baseURL = fm.containerURL(forSecurityApplicationGroupIdentifier: "group.book.ckk")
        let url = URL(fileURLWithPath: "a.txt", relativeTo: baseURL)

        do {
            try "Hello".write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error)
        }
        
        // 共享方式二：UserDefaults - 寫入
        let user = UserDefaults(suiteName: "group.book.ckk")
        user?.set(1234, forKey: "MY_KEY")
    }


}

