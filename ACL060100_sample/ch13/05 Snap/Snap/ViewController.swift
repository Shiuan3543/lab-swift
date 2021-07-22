//
//  ViewController.swift
//  Snap
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
    }

    @IBAction func tapHandler(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: view)
        
        let snap = UISnapBehavior(item: dynItem, snapTo: point)
        
        // damping是阻尼，控制物體衝向新座標後的擺盪量
        // 值的範圍為0.0~1.0。0.0擺盪最大，1.0擺盪最小
        // 預設值為0.5
        snap.damping = 0.5;
        
        // snap 效果結束後就失效，因此每一次使用 snap 前
        // 都必須先把之前的 snap 清除掉
        
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
    }
    
}

