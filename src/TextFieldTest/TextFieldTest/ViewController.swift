//
//  ViewController.swift
//  TextFieldTest
//
//  Created by imedi on 2021/5/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TextFieldTest(_ sender: UITextField) {
        view.endEditing(true)
    }//輸入後動作

    //Keybord Type 選擇鍵盤類型
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)//關閉時加動畫
//        UIView.animate(withDuration: 0){
//            self.view.endEditing(true)
//        }立即關閉
        
//      勾選Secure Text only隱藏輸入
    }
    
    
}

