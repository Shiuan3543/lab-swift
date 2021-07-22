//
//  MyViewController.swift
//  NewViewController
//
//  Created by KoKang Chu on 2019/7/31.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    var str: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let str = str {
            print(str)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
