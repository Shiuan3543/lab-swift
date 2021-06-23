//
//  ViewController.swift
//  ActivityIndicatorViewTest
//
//  Created by imedi on 2021/5/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AIVT: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AIVT.stopAnimating()//初始隱藏
    }
    @IBAction func AIVTswitch(_ sender: UISwitch) {
        if sender.isOn {
            AIVT.startAnimating()//on開啟動畫
        } else {
            AIVT.stopAnimating()//off關閉動畫
        }
    }
}

