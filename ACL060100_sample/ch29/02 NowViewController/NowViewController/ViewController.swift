//
//  ViewController.swift
//  NowViewController
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let sd = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        let vc = sd.findViewController()
        print(vc == self)
    }
}

