//
//  ViewController.swift
//  WebViewTest
//
//  Created by imedi on 2021/6/8.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var hololiveWebviewtest: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let holobuttonUrl = URL(string: "https://www.myinstants.com/search/?page=3&name=Hololive")
        let Request = URLRequest(url: holobuttonUrl!)
        hololiveWebviewtest.load(Request)
    }
}

