//
//  ViewController.swift
//  Toolbar
//
//  Created by KoKang Chu on 2019/7/29.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionButtonClick(_ sender: Any) {
        print("按下動作按鈕")
    }
     
    @IBAction func trashButtonClick(_ sender: Any) {
        print("按下垃圾桶按鈕")
    }

}

