//
//  ViewController.swift
//  CustomNorify
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @objc let receiver = MyReceiver()
    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(
            receiver,
            selector: #selector(MyReceiver.receiveNotification(_:)),
            name: NSNotification.Name("MYKEY"),
            object: nil
        )
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(
            name: NSNotification.Name("MYKEY"),
            object: Int(n)
        )
        n = n + 1
    }

}

