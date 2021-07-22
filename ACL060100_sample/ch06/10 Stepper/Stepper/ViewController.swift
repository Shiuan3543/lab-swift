//
//  ViewController.swift
//  Stepper
//
//  Created by KoKang Chu on 2019/7/26.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stepper(_ sender: UIStepper) {
        print(sender.value)
    }

}

