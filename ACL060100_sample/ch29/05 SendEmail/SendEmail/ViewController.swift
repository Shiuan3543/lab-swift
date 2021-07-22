//
//  ViewController.swift
//  SendEmail
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let to = "to@emai.com"
        let cc = "cc@email.com"
        let bcc = "bcc@email.com"
        let subject = "信件主旨"
    
        let mail = "mailto:\(to)?subject=\(subject)&cc=\(cc)&bcc=\(bcc)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    
        let url = URL(string: mail!)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }


}

