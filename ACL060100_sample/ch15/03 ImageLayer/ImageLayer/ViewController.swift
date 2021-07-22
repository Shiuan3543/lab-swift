//
//  ViewController.swift
//  ImageLayer
//
//  Created by KoKang Chu on 2019/7/8.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layer = CALayer()
        layer.frame = CGRect(x: 50, y: 100, width: 200, height: 300)
        layer.contents = UIImage(named: "IMG_3239.jpeg")?.cgImage
        
        // 相當於 Image View 元件設定 Aspect Fill
        layer.contentsGravity = .resizeAspectFill
        // 相當於 Image View 元件設定「Clip To Bounds」
        layer.masksToBounds = true
        
        view.layer.addSublayer(layer)
    }


}

