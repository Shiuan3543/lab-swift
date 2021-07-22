//
//  ViewController.swift
//  KeyValue_iCloud
//
//  Created by KoKang Chu on 2019/7/22.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let store = NSUbiquitousKeyValueStore()
    var n: Int64 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 儲存資料
    @IBAction func saveButton(_ sender: Any) {
        store.set(n, forKey: "MY_KEY")
        if store.synchronize() {
            print("儲存成功, n = \(n)")
            n += 1
        } else {
            print("儲存失敗")
        }
    }

    // 讀取資料
    @IBAction func openButton(_ sender: Any) {
        n = store.longLong(forKey: "MY_KEY")
        print("儲存的資料為: \(n)")
    }

    // 刪除資料
    @IBAction func deleteButton(_ sender: Any) {
        store.removeObject(forKey: "MY_KEY")
        if store.synchronize() {
            print("刪除成功")
        } else {
            print("刪除失敗")
        }
    }
}

