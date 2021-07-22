//
//  ViewController.swift
//  Alert
//
//  Created by KoKang Chu on 2019/7/17.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 有 .alert 與 .actionSheet 兩種風格
        let alertController = UIAlertController(
            title: "標題",
            message: "Alert 風格",
            preferredStyle: .alert)
        
        // 宣告一個「確定」按鈕
        let okAction = UIAlertAction(title: "確定", style: .default)
        { (action) in
            // 按鈕按下去後要做的事情寫在這
        }
        
        // 將確定按鈕加到UIAlertController
        alertController.addAction(okAction)
        
        // 顯示訊息框
        present(alertController, animated: true, completion: nil)
    }
}

