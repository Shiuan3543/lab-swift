//
//  ViewController.swift
//  IWebView
//
//  Created by KoKang Chu on 2019/7/29.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {

    var webView: WKWebView!
    
    override func loadView() {
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = WKUserContentController()
        // 註冊名稱 Test，讓網頁上的 JavaScript 可以透過
        // window.webkit.messageHandlers.Test 傳資料給 App
        configuration.userContentController.add(self, name: "Test")
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.uiDelegate = self
        // 將 webView 取代掉原本預設的 view 元件
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "index", ofType: ".html")
        let url = URL(fileURLWithPath: path!)
        webView.loadFileURL(url, allowingReadAccessTo: url)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // 收到的資料放在 message.body 中
        print(message.name)
        let tmp = message.body as! String
        // setLabelTitle 為網頁中的 JavaScript 函數
        webView.evaluateJavaScript(
            "setLabelTitle('\(tmp)')",
            completionHandler: nil
        )
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alert = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "確定",
            style: .default,
            handler: nil
        )
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        completionHandler()
    }


}

