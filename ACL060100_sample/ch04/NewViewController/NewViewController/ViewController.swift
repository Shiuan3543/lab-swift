//
//  ViewController.swift
//  NewViewController
//
//  Created by KoKang Chu on 2019/7/31.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_vc_to_myvc" {
            let vc = segue.destination as! MyViewController
            vc.str = "hello"
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        if segue.identifier == "unwind_vc_to_myvc" {
            let vc = segue.source as! MyViewController
            if let str = vc.str {
                print(str)
            }
        }
    }

}

