//
//  ViewController.swift
//  Hellowrold
//
//  Created by KoKang Chu on 2019/7/31.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        label.text = "hello world"
    }
    
}

