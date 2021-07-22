//
//  ViewController.swift
//  NoBackup
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let filename = NSHomeDirectory() + "/Documents/a.txt"
        
        // 先建立 a.txt 檔案
        fm.createFile(atPath: filename, contents: nil, attributes: nil)
        // 將 a.txt 的絕對路徑轉成 URL 格式
        var url = URL(fileURLWithPath: filename)
        // 設定 a.txt 為不用備份
        do {
            var values = URLResourceValues()
            values.isExcludedFromBackup = true
            try url.setResourceValues(values)
        } catch {
            print("設定失敗")
        }
    }


}

