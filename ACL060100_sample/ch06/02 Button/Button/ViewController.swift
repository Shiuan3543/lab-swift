//
//  ViewController.swift
//  Button
//
//  Created by KoKang Chu on 2019/7/25.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.isEnabled = true
        button.isSelected = true
        button.setTitle("被選到了", for: .selected)
    }


}

