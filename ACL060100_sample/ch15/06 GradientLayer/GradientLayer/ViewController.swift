//
//  ViewController.swift
//  GradientLayer
//
//  Created by KoKang Chu on 2019/7/8.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.cyan.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.addSublayer(gradientLayer)
    }


}

