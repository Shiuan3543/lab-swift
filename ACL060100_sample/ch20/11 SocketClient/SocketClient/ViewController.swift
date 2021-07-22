//
//  ViewController.swift
//  SocketClient
//
//  Created by KoKang Chu on 2019/7/12.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    // iStream 與 oStream 需宣告成全域
    var iStream: InputStream?
    var oStream: OutputStream?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 與 socket server 連線
        Stream.getStreamsToHost(withName: "localhost", port: 12345, inputStream: &iStream, outputStream: &oStream)
        
        // 開啟輸出、輸入資料流
        if let iStream = iStream, let oStream = oStream {
            iStream.open()
            oStream.open()
            
            // 透過執行續來偵測並讀取server端傳過來的資料
            waitingData()
            print("Ready GO")
        }

    }

    @IBAction func onClick(_ sender: Any) {
        guard textField.text != nil else {
            return
        }
        send(textField.text!)
    }
    
    func waitingData() {
        guard let iStream = iStream else {
            print("ERROR: input stream is nil")
            return
        }
        var buf = Array(repeating: UInt8(0), count: 1024)
        DispatchQueue.global().async {
            while true {
                let n = iStream.read(&buf, maxLength: buf.count)
                let data = Data(bytes: buf, count: n)
                DispatchQueue.main.async {
                    // 跟 UI 有關的程式碼要在主執行續中執行
                    self.label.text = String(data: data, encoding: .utf8)
                }
            }
        }
    }
    
    func send(_ string: String) {
        guard let oStream = oStream else {
            print("ERROR: output stream is nil")
            return
        }
        var buf = Array(repeating: UInt8(0), count: 1024)
        let data = string.data(using: .utf8)!
        
        data.copyBytes(to: &buf, count: data.count)
        oStream.write(buf, maxLength: data.count)
    }

}

