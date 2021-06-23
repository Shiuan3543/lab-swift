//
//  ViewController.swift
//  SwitchTest
//
//  Created by imedi on 2021/5/26.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var Change: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Change.image = UIImage(named: "Mumi")//設定初始圖片Mumi
        Changebackbutton.setTitle("Mumi", for: .normal)
        Changebackbutton.setTitleColor(UIColor.darkGray, for: .normal)
        Changebackbutton.backgroundColor = UIColor.yellow
        
        Changebackbutton.isEnabled = false
        Changebackbutton.isHighlighted = false
    }
    @IBAction func ChangePekoWatame(_ sender: UISwitch) {
        if sender.isOn {
            Change.image = UIImage(named: "Peko")//switch on 顯示圖片Peko
            Changebackbutton.isEnabled = true
            Changebackbutton.isHighlighted = true
            Changebackbutton.setTitle("Peko", for: .normal)
            Changebackbutton.setTitleColor(UIColor.white, for: .normal)
            Changebackbutton.backgroundColor = UIColor.blue
        } else {
            Change.image = UIImage(named: "Watame")//switch off 顯示圖片Watame
            Changebackbutton.isEnabled = true
            Changebackbutton.isHighlighted = true
            Changebackbutton.setTitle("Watame", for: .normal)
            Changebackbutton.setTitleColor(UIColor.yellow, for: .normal)
            Changebackbutton.backgroundColor = UIColor.brown
        }
    }

    @IBOutlet weak var Changebackbutton: UIButton!
    
    @IBAction func Changeback(_ sender: UIButton) {
        Change.image = UIImage(named: "Mumi")//設定按鈕返回初始圖片Mumi
        Changebackbutton.setTitle("Mumi", for: .normal)
        Changebackbutton.setTitleColor(UIColor.darkGray, for: .normal)
        Changebackbutton.backgroundColor = UIColor.yellow
        Changebackbutton.isEnabled = !Changebackbutton.isEnabled
        Changebackbutton.isHighlighted = !Changebackbutton.isHighlighted
    }
}
