//
//  ViewController.swift
//  MaskLayer
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
        let maskLayer = CALayer()
        maskLayer.frame = imageView.bounds
        maskLayer.contentsGravity = .resizeAspect
        maskLayer.contents = UIImage(named: "mask.png")?.cgImage
        
        imageView.layer.mask = maskLayer
    }


}

