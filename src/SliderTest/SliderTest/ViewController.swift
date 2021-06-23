//
//  ViewController.swift
//  SliderTest
//
//  Created by imedi on 2021/5/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showsliderLabel.text = String(0.5)
    }
    @IBOutlet weak var showsliderLabel: UILabel!
    //顯示滑桿數值文字標籤
    @IBAction func SliderT(_ sender: UISlider) {
        //滑桿funtion
        showsliderLabel.text = String(sender.value)//強制Int轉String
    }
}

