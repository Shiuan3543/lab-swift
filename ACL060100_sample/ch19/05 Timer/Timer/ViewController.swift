//
//  ViewController.swift
//  Timer
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.ticker()
        }
    }

    func ticker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        let whatTime = formatter.string(from: Date())
        
        print(whatTime)
    }

}

