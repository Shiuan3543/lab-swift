//
//  ViewController.swift
//  ImageLayer
//
//  Created by KoKang Chu on 2019/7/8.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 陰影
        let shadowLayer = CALayer()
        shadowLayer.frame = imageView.frame
        // 背景只要不是透明色即可（預設為透明色）
        shadowLayer.backgroundColor = UIColor.white.cgColor
        shadow(in: shadowLayer)
        // 注意是view插入shadowLayer，不是imageView
        view.layer.insertSublayer(shadowLayer, below: imageView.layer)
        
        // 圓角
        // shadowLayer也必須要設定圓角
        cornerRadius(in: shadowLayer)
        cornerRadius(in: imageView.layer)
    }

    // 設定陰影
    func shadow(in layer: CALayer) {
        // 陰影顏色為灰色
        layer.shadowColor = UIColor.gray.cgColor
        
        // 陰影向圖層右下角偏移5點;
        layer.shadowOffset = CGSize(width: 5, height: 5)
        // 設定透明度
        layer.shadowOpacity = 0.8
        // 設定圓角
        layer.shadowRadius = 10.0
    }
    
    // 設定圓角
    func cornerRadius(in layer: CALayer) {
        layer.cornerRadius = 10
    }
}

