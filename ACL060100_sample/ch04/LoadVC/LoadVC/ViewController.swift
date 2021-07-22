//
//  ViewController.swift
//  LoadVC
//
//  Created by KoKang Chu on 2019/7/31.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "newVC")
        show(vc!, sender: self)
    }
    
}

