//
//  ViewController.swift
//  ButtonTest
//
//  Created by imedi on 2021/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonOutlet.isEnabled = true //設定初始狀態可用
        buttonOutlet.isSelected = false//設定初始狀態非選擇
        //Buttonoutlet.reversesTitleShadowWhenHighlighted = true//在按鈕狀態為highlighted時，shadow offset的位置會被上下左右翻轉（shadow offset的width及height乘上(-1)）
        buttonOutlet.setTitle("Peko", for: .normal)
        buttonOutlet.setTitleColor(UIColor.blue, for: .normal)
        //        Buttonoutlet.setImage(UIImage(named: "Peko"), for: .normal)//??????????
        //        Buttonoutlet.setBackgroundImage(UIImage(named: "blue"), for: .normal)//??????????
        buttonOutlet.setTitle("Warukunaiyone", for: .selected)//
        buttonOutlet.setTitleColor(UIColor.yellow, for: .selected)//
        //        Buttonoutlet.setImage(UIImage(named: "Watame"), for: .selected)//??????????
        //        Buttonoutlet.setBackgroundImage(UIImage(named: "yellow"), for: .selected)//?????????
        buttonOutlet.setTitle("Mumi", for: .highlighted)
        buttonOutlet.setTitleColor(UIColor.green, for: .highlighted)
        //        Buttonoutlet.setImage(UIImage(named: "Mumi"), for: .selected)//??????????
        //        Buttonoutlet.setBackgroundImage(UIImage(named: "orange"), for: .selected)//?????????
        buttonOutlet.addTarget(self, action:#selector(SwitchIdontKonw) , for: .touchUpInside)
        buttonOutlet.backgroundColor = UIColor.gray//按鈕背景顏色黑
    }
    @IBAction func SwitchIdontKonw(_ sender: UIButton) {
        //TouchupInside
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            buttonOutlet.backgroundColor = UIColor.red//按鈕背景顏色紅
        } else {
            buttonOutlet.backgroundColor = UIColor.gray//按鈕背景顏色黑
        }
    }
}
