//
//  ViewController.swift
//  WebAPI_POST
//
//  Created by KoKang Chu on 2019/7/12.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "http://my.web/add.php")
        var request = URLRequest(
            url: url!,
            cachePolicy:.reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 30)
        request.httpBody = "x=5&y=3".data(using: .utf8)
        request.httpMethod = "POST"
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let html = String(data: data, encoding: .utf8)
                print(html!)
            }
        }
        
        dataTask.resume()

    }


}

