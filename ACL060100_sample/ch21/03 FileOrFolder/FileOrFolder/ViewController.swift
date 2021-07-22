//
//  ViewController.swift
//  FileOrFolder
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = NSHomeDirectory()
        let fm = FileManager.default
        var isDir: ObjCBool = true
        
        fm.fileExists(atPath: path, isDirectory: &isDir)
        if isDir.boolValue {
            print("此為目錄")
        } else {
            print("此為檔案")
        }
    }


}

