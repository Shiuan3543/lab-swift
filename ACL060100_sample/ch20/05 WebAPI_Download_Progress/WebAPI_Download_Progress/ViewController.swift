//
//  ViewController.swift
//  WebAPI_Download_Progress
//
//  Created by KoKang Chu on 2019/7/12.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    var mydata = (data: Data(), length: Int64())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressView.progress = 0
        label.text = ""
        
        let url = URL(string: "一個下載圖片的網址")
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        let dataTask = session.dataTask(with: url!)
        dataTask.resume()
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping
        (URLSession.ResponseDisposition) -> Void) {
        mydata.length = response.expectedContentLength
        completionHandler(.allow)
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        // 組合下載的資料
        DispatchQueue.main.async {
            self.mydata.data.append(data)
            let progress = Float(self.mydata.data.count) / Float(self.mydata.length)
            self.progressView.progress = progress
            self.label.text = String(Int(progress * 100)) + "%"
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error == nil {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.mydata.data)
            }
        }
    }
}

