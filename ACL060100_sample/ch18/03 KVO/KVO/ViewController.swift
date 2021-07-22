//
//  ViewController.swift
//  KVO
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @objc dynamic var n = 0
    let observer = MyObserver()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addObserver(observer, forKeyPath: "n", options: [.new, .old], context: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        n += 1
    }

}

