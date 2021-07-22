//
//  ViewController.swift
//  Attachement
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dynItem: UIView!
    @IBOutlet weak var anchor: UILabel!
    var ani: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ani = UIDynamicAnimator(referenceView: view)
        let be = UIAttachmentBehavior(
            item: dynItem,
            offsetFromCenter: UIOffset(horizontal: 25, vertical: 25),
            attachedToAnchor: anchor.center
        )
        
        ani.addBehavior(be)
    }

    @IBAction func panHandler(_ sender: UIPanGestureRecognizer) {
        // 取得手指的座標
        let point = sender.location(in: view)
        
        // 移動 anchor 物件
        anchor.center = point
        
        // 透過 ani 變數取得附著這個動態行為
        let be = ani.behaviors.first as! UIAttachmentBehavior
        
        // 移動大的View元件（即 dynItem）到新座標
        be.anchorPoint = point
    }
    
}

