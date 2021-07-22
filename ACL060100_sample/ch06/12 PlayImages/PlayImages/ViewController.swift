//
//  ViewController.swift
//  PlayImages
//
//  Created by KoKang Chu on 2019/7/26.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var images = [UIImage]()
        
        // 載入所有要播放的圖片
        for i in 1...5 {
            let name = String(format: "%02d", i)
            images.append(UIImage(named: name)!)
        }
        
        imageView.animationImages = images
        // 設定10秒內播完
        imageView.animationDuration = 10
        // 設定重複2次
        imageView.animationRepeatCount = 2
        
        // 開始播放
        imageView.startAnimating()
    }


}

