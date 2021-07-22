//
//  ViewController.swift
//  Activity
//
//  Created by KoKang Chu on 2019/7/26.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var activity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func valueChanged(_ sender: UISwitch) {
        if sender.isOn {
            activity.startAnimating()
        } else {
            activity.stopAnimating()
        }
    }

}

