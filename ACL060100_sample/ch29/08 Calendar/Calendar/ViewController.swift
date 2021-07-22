//
//  ViewController.swift
//  Calendar
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 取得本地時區的日曆
        let calendar = Calendar.current
        
        // 設定要取得 calendar 中的年、月、日
        var set = Set<Calendar.Component>()
        set.insert(Calendar.Component.year)
        set.insert(Calendar.Component.month)
        set.insert(Calendar.Component.day)
        
        let c = calendar.dateComponents(set, from: Date())
        print("\(c.year!)年\(c.month!)月\(c.day!)日")
    }


}

