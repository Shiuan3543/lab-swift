//
//  ViewController.swift
//  VC
//
//  Created by KoKang Chu on 2019/7/25.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myView: UIView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 顯示 myView
    @IBAction func showMyView(_ sender: Any) {
        blurEffect.frame = view.frame
        view.addSubview(blurEffect)
        
        myView.center = view.center
        view.addSubview(myView)
    }
    
    // 關閉 myView
    @IBAction func closeMyView(_ sender: Any) {
        blurEffect.removeFromSuperview()
        myView.removeFromSuperview()
    }

}

