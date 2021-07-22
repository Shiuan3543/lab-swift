//
//  ViewController.swift
//  SystemSetting
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 取得 name_preference 的Item設定值
        let user = UserDefaults.standard
        var title = user.string(forKey: "name_preference")
        
        // 改為大寫
        title = title?.uppercased()
        
        // 將修改後的資料寫回去
        user.set(title, forKey: "name_preference")
    }


}

