//
//  ViewController.swift
//  Gravity
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dynItem: UIView!
    var ani: UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ani = UIDynamicAnimator(referenceView: view)
        
        // 設定重力加速度作用在哪個物件上
        let gravity = UIGravityBehavior(items: [dynItem])
        
        // 設定重力加速度的方向，範圍為-1.0~+1.0，預設值為 x:0.0 y:1.0
        gravity.gravityDirection = CGVector(dx: 0.0, dy: 1.0)
        
        ani.addBehavior(gravity)
    }


}

