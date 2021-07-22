//
//  ViewController.swift
//  Safari
//
//  Created by KoKang Chu on 2019/7/17.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = SFSafariViewController(url: URL(string: "https://www.apple.com")!)
        show(vc, sender: self)
    }
}

