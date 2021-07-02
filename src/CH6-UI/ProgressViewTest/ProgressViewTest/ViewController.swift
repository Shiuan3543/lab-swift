//
//  ViewController.swift
//  ProgressViewTest
//
//  Created by imedi on 2021/5/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Progressviewtest: UIProgressView!
    @IBOutlet weak var ShowProgress: UILabel!
    @IBOutlet weak var ShowSlider: UISlider!
    @IBOutlet weak var ButtonInput: UIButton!
    @IBOutlet weak var UITextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Progressviewtest.progress = 0.5
        ButtonInput.isEnabled = true //設定初始狀態可用
        ButtonInput.setTitle("Enter", for: .normal)
        ButtonInput.setTitleColor(UIColor.white, for: .normal)
        ButtonInput.setTitle("Sure?", for: .highlighted)
        ButtonInput.setTitleColor(UIColor.green, for: .highlighted)
        ButtonInput.backgroundColor = UIColor.darkText
    }
    @IBAction func slideraction(_ sender: UISlider) {
        ShowProgress.text=String(sender.value)
        Progressviewtest.progress = sender.value
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)//關閉時加動畫
//        UIView.animate(withDuration: 0){
//            self.view.endEditing(true)
//        }立即關閉
        
//      勾選Secure Text only隱藏輸入
    }
    @IBAction func Textinput(_ sender: UIButton) {
        ButtonInput.backgroundColor = UIColor.red
        //UITextField.
    }
    @IBAction func TextFieldInput(_ sender: UITextField) {
    
    }
}
