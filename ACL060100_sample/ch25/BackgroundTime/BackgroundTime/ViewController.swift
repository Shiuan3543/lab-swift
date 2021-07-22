//
//  ViewController.swift
//  BackgroundTime
//
//  Created by KoKang Chu on 2019/7/16.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.global().async {
            while (true) {
                DispatchQueue.main.async {
                    let t = UIApplication.shared.backgroundTimeRemaining
                    print("還剩下\(t)秒")
                }
                sleep(1)
            }
        }
    }


}

