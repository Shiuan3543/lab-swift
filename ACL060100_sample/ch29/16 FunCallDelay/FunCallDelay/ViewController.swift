//
//  ViewController.swift
//  FunCallDelay
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        perform(#selector(myFunc(_:)), with: "hello", afterDelay: 2.0)
        // 以下如果還有程式碼的話會立即執行
        print("執行")
    }

    @objc func myFunc(_ sender: Any?) {
        if sender is String {
            print(sender!)
        }
    }

}

