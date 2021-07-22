//
//  ViewController.swift
//  Closure
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sum(1, 2, 3, 4, 5) { (result) in
            print(result)
        }
    }

    func sum(_ values: Double..., completion: (_ result: Double) -> Void) {
        var answer = 0.0
        for n in values {
            answer += n
        }
        
        completion(answer)
    }
}

