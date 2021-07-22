//
//  ViewController.swift
//  ActivityController
//
//  Created by KoKang Chu on 2019/7/17.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let string = "hello"
        let image = UIImage(named: "IMG_3077.JPG")
        
        let vc = UIActivityViewController(
            activityItems: [string, image!],
            applicationActivities: nil
        )
        present(vc, animated: true, completion: nil)

    }
}

