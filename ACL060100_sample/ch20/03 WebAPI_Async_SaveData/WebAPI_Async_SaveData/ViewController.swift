//
//  ViewController.swift
//  WebAPI_Async_SaveData
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
        let session = URLSession(configuration: .default)
        
        // 下載資料後存檔在加目錄中的tmp目錄下，完整路徑在location參數中
        let dnTask = session.downloadTask(with: url!) { (location, response, error) in
            // 注意此 block 區段已在另外一個執行緒
            if error == nil, let location = location {
                do {
                    // 從存檔中讀取資料
                    let string = try String(contentsOf: location)
                    print(string)
                } catch {
                    print(error)
                }
            } else {
                print("讀取資料錯誤")
            }
        }
        
        // 開始執行
        dnTask.resume()

    }


}

