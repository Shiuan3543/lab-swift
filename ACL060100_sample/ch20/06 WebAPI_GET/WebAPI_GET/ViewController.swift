//
//  ViewController.swift
//  WebAPI_GET
//
//  Created by KoKang Chu on 2019/7/12.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            let url = URL(string: "https://my.web/add.php?x=10&y=20")
            // 取得送出資料後的傳回值
            let html = try String(contentsOf: url!)
            print(html)
        } catch {
            print(error)
        }

    }


}

