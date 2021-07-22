//
//  ViewController.swift
//  MainQueue
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            // 程式區段1
            Array(0...9).forEach { (i) in
                print(i)
            }
        }

        DispatchQueue.main.async {
            // 程式區段2
            Array(10...19).forEach { (i) in
                print(i)
            }
        }
    }


}

