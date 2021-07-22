//
//  ViewController.swift
//  CountDown
//
//  Created by KoKang Chu on 2019/7/29.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var second = datePicker.countDownDuration
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            guard second >= 0 else {
                timer.invalidate()
                return
            }
            print("剩餘\(second)秒")
            second -= 1
        }
    }
}

