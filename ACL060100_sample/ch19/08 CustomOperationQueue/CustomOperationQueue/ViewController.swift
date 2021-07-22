//
//  ViewController.swift
//  CustomOperationQueue
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let q1 = MyOperation(1...9)
        let q2 = MyOperation(10...19)
        
        OperationQueue().addOperations([q1, q2], waitUntilFinished: true)
        print("done")
    }


}

