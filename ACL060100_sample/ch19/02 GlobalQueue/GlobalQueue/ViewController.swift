//
//  ViewController.swift
//  GlobalQueue
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // global() 不帶參數相當於 global(qos: .default)
        let q = DispatchQueue.global()
        q.sync {
            // 程式區段1
            Array(0...9).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }
        
        q.async {
            // 程式區段2
            Array(10...19).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }

        q.async {
            // 程式區段3
            Array(20...29).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }

    }


}

