//
//  ViewController.swift
//  Progress
//
//  Created by KoKang Chu on 2019/7/26.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var progress: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progress.progress = 0.9
    }

}

