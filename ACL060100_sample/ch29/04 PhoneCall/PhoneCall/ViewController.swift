//
//  ViewController.swift
//  PhoneCall
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "tel://123456")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }


}

