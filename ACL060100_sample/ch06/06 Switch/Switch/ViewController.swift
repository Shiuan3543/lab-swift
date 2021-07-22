//
//  ViewController.swift
//  Switch
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

    
    @IBAction func valueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("開")
        } else {
            print("關")
        }
    }

}

