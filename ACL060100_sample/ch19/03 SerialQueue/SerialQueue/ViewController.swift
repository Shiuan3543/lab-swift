//
//  ViewController.swift
//  SerialQueue
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let q1 = DispatchQueue(label: "q1")
        let q2 = DispatchQueue(label: "q2")

        q1.async {
            // 程式區段1
            Array(0...9).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }
        
        q1.async {
            // 程式區段2
            Array(10...19).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }
        
        q2.async {
            // 程式區段3
            Array(20...29).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }

    }


}

