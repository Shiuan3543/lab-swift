//
//  ViewController.swift
//  Random
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 1...10 之間的整數
        let n = Int.random(in: 1...10)
        // 0...1 之間的小數
        let f = Float.random(in: 0...1)
        // 5...10 之間的小數
        let d = Double.random(in: 5...10)
        // 從字串中隨機挑選一個字元
        let s = "Hello".randomElement()
    }


}

