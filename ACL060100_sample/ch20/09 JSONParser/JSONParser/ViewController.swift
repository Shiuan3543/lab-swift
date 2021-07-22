//
//  ViewController.swift
//  JSONParser
//
//  Created by KoKang Chu on 2019/7/12.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "test", withExtension: "json")
        // (1) 讀取 JSON 字串
        do {
            let data = try Data(contentsOf: url!)
            // (2) 解析 JSON
            // JSON 解析後的資料型態只有兩種，字典或是陣列
            // 如果是陣列，使用迴圈就可以取得所有資料
            let jsonObj = try JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            ) as! [[String: Any]]
            
            // (3) 取出結果
            for p in jsonObj {
                print("姓名: \(p["姓名"]!)")
                print("年齡: \(p["年齡"]!)")
                if let tels = p["電話"] as? [String: String] {
                    print ("公司電話: \(tels["公司"]!)")
                    print ("住家電話: \(tels["住家"]!)")
                }
                
                print("----------------")
            }
        } catch {
            print(error.localizedDescription)
        }

    }


}

