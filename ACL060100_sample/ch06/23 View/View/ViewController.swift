//
//  ViewController.swift
//  View
//
//  Created by KoKang Chu on 2019/7/29.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func displayViewToggle(_ sender: UISwitch) {
        bottomConstraint.constant = sender.isOn ? 0 : -128
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
}

