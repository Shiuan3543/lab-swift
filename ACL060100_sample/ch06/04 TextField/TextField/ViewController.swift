//
//  ViewController.swift
//  TextField
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0) {
            self.view.endEditing(true)
        }
    }

}

