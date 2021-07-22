//
//  ViewController.swift
//  Keyboard+Toolbar
//
//  Created by KoKang Chu on 2019/7/29.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var toolbar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for tmp in view.subviews {
            if tmp is UITextField {
                (tmp as! UITextField).inputAccessoryView = toolbar
            }
        }
    }

    @IBAction func testButton(_ sender: Any) {
        for tmp in view.subviews {
            if tmp.isFirstResponder, tmp is UITextField {
                (tmp as! UITextField).text = "hello"
                break
            }
        }
    }

    @IBAction func doneButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.view.endEditing(true)
        }
    }

}

