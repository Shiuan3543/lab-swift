//
//  ViewController.swift
//  FileIO_iCloud
//
//  Created by KoKang Chu on 2019/7/22.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fileURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if FileManager.default.ubiquityIdentityToken == nil {
            print("請開啟 iCloud Drive")
        } else {
            let path = FileManager.default.url(forUbiquityContainerIdentifier: nil)
            fileURL = path?.appendingPathComponent("Documents/a.txt")
        }
    }

    // 存檔
    @IBAction func saveButton(_ sender: Any) {
        guard let fileURL = fileURL else {
            return
        }
        
        do {
            try "嗨您好".write(to: fileURL, atomically: true, encoding: .utf8)
            print("成功寫入")
        } catch {
            print(error)
        }
    }

    // 讀檔
    @IBAction func openButton(_ sender: Any) {
        guard let fileURL = fileURL else {
            return
        }

        do {
            let str = try String(contentsOf: fileURL, encoding: .utf8)
            print(str)
        } catch {
            print(error)
        }
    }
}

