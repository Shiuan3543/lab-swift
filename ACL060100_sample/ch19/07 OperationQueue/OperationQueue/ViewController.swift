//
//  ViewController.swift
//  OperationQueue
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let q = OperationQueue()
        q.addOperation {
            // Thread 1
            Array(0...9).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }

        q.addOperation {
            // Thread 2
            Array(10...19).forEach { (i) in
                print(i)
                Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
            }
        }
    }


}

