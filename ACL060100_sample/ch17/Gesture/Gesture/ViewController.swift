//
//  ViewController.swift
//  Gesture
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapHandler(_ sender: UITapGestureRecognizer) {
        for i in 0..<sender.numberOfTouchesRequired {
            let point = sender.location(ofTouch: i, in: view)
            print("第\(i)根手指的座標為\(point)")
        }
    }
    
    @IBAction func pinchHandler(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .changed:
            // scale > 1 是放大
            // scale < 1 是縮小
            print("\(sender.scale)")
            
        default:
            break
        }
    }
    
    @IBAction func rotationHandler(_ sender: UIRotationGestureRecognizer) {
        let rad = Float(sender.rotation)
        let deg = rad * 180 / Float.pi
        
        if deg >= 0 {
            print("順時針旋轉")
        } else {
            print("逆時針旋轉")
        }
        
        print("弧度:\(rad) 角度:\(deg)")
    }
    
    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            print("向右方揮擊")
            
        default:
            break
        }
    }
    
    @IBAction func panHandler(_ sender: UIPanGestureRecognizer) {
        for i in 0..<sender.numberOfTouches {
            let point = sender.location(ofTouch: i, in: sender.view)
            print("第\(i)根手指座標為 \(point)")
        }
    }

    @IBAction func longpressHandler(_ sender: UILongPressGestureRecognizer) {
        for i in 0..<sender.numberOfTouches {
            let point = sender.location(ofTouch: i, in: sender.view)
            print("第\(i)根手指的座標為\(point)")
        }
    }
    
    @IBAction func edgepanHandler(_ sender: UIScreenEdgePanGestureRecognizer) {
        for i in 0..<sender.numberOfTouches {
            let point = sender.location(ofTouch: i, in: sender.view)
            print("第\(i)根手指的座標為\(point)")
        }
    }
}

