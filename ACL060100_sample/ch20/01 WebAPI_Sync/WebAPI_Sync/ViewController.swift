//
//  ViewController.swift
//  WebAPI_Sync
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            // 文字
            let url = URL(string: "https://www.apple.com")
            let html = try String(contentsOf: url!)
            print(html)
            
            // 圖片
            let urlImg = URL(string: "https://host_ip/a.jpg")
            // 如果傳回的是二位元格式資料例如圖片，就使用 Data 類別處理
            let data = try Data(contentsOf: urlImg!)
            let image = UIImage(data: data)
        } catch {
            print("***\(error)")
        }

    }


}

