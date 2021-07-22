//
//  ViewController.swift
//  Segment
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

    @IBAction func click(_ sender: UISegmentedControl) {
        // 取得點選到的分段的索引，最左側為0
        let index = sender.selectedSegmentIndex
        // 根據索引取得分段上的標題文字
        print(sender.titleForSegment(at: index)!)
    }
    
}

