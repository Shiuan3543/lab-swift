//
//  ViewController.swift
//  Localize
//
//  Created by KoKang Chu on 2019/7/31.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let str = NSLocalizedString("festival", comment: "註解，可隨意輸入")
        print(str)
    }


}

