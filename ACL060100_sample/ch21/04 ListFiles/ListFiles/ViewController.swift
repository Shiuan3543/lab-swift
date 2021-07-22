//
//  ViewController.swift
//  ListFiles
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        do {
            let files = try fm.contentsOfDirectory(atPath: NSHomeDirectory())
            for file in files {
                print(file)
            }
        } catch {
            print("error")
        }
    }


}

