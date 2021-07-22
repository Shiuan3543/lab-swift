//
//  ViewController.swift
//  WebAPI_Async
//
//  Created by KoKang Chu on 2019/7/12.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.apple.com")
        // 使用預設的設定建立 session
        let session = URLSession(configuration: .default)
        // NSURLSessionDataTask 為讀取資料，讀取完成的資料會放在 data 中
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // 注意此 block 區段已在另外一個執行緒
            if error == nil, let data = data {
                let html = String(data: data, encoding: .utf8)
                print(html ?? "")
            } else {
                print("資料讀取失敗")
            }
        }
        
        // 開始讀取資料
        dataTask.resume()

    }


}

