//
//  ViewController.swift
//  Collision
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
        
        // 引力
        let gravity = UIGravityBehavior(items: [dynItem])
        // 碰撞
        let collision = UICollisionBehavior(items: [dynItem])
        // 遇邊界停止
        collision.translatesReferenceBoundsIntoBoundary = true
        
        ani.addBehavior(gravity)
        ani.addBehavior(collision)
    }


}

