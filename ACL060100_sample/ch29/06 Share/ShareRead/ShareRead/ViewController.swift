//
//  ViewController.swift
//  ShareRead
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 共享方式一：檔案共享 - 讀取
        let fm = FileManager.default
        let baseURL = fm.containerURL(forSecurityApplicationGroupIdentifier: "group.book.ckk")
        let url = URL(fileURLWithPath: "a.txt", relativeTo: baseURL)

        do {
            let text = try String(contentsOf: url, encoding: .utf8)
            print(text)
        } catch {
            print(error)
        }
        
        // 共享方式二：UserDefaults - 讀取
        let user = UserDefaults(suiteName: "group.book.ckk")
        let n = user?.integer(forKey: "MY_KEY")
        print(n!)
    }


}

