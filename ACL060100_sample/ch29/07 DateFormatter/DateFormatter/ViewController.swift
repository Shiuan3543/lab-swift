//
//  ViewController.swift
//  DateFormatter
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 將 Date 格式轉成字串
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d H:m:s"
        let string = formatter.string(from: Date())
        print("現在（本地）時間: \(string)")
        
        // 將字串轉成 Date 格式
        let date = formatter.date(from: "2019/1/1 18:0:0")
        // 注意：字串為本地時間，轉換後的 date 為格林威治時間
        print(date!)
    }


}

