//
//  ViewController.swift
//  Push
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dynItem: UIView!
    var ani: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ani = UIDynamicAnimator(referenceView: view)
        
        // mode參數：
        // .instantaneous 推一下就停止 => 等速前進
        // .continuous 持續地推這個物體 => 等加速前進
        let push = UIPushBehavior(items: [dynItem], mode: .continuous)
        
        // 推力強度：1.0 代表施力「100 point/秒平方」
        push.magnitude = 1.0
        
        // angle 接受的值為弧度，但一般人熟悉的是角度，因此我們使用公式
        // 角度 / 180.0 * PI 來轉換成弧度
        // 當角度為 0 時，施力方向為九點鐘方向，90度為12點鐘方向，因此
        // 45度為從西北方向物體施力
        push.angle = 45.0 / 180.0 * CGFloat.pi
        
        // 也可以使用
        // push.pushDirection = CGVector(dx: 0.1, dy: 0.8)
        
        ani.addBehavior(push)

    }


}

