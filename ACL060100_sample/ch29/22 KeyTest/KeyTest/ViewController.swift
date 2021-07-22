//
//  ViewController.swift
//  KeyTest
//
//  Created by 朱克剛 on 2020/9/16.
//

import UIKit
import CryptoKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let hashed = Insecure.MD5.hash(data: Data("1234".utf8))
        print(hashed.description)
    }

    @IBAction func save(_ sender: Any) {
        let data = "hello world".data(using: .utf8)!
        let status = KeyChain.save(data, forKey: "MyKey")
        // if status == 0, success
        print(status)
    }

    @IBAction func load(_ sender: Any) {
        if let data = KeyChain.load(forKey: "MyKey") {
            print(String(data: data, encoding: .utf8)!)
        } else {
            print("load error")
        }
    }

    @IBAction func update(_ sender: Any) {
        let data = "1234".data(using: .utf8)!
        let status = KeyChain.update(data, forKey: "MyKey")
        // if status == 0, success
        print(status)
    }

    @IBAction func remove(_ sender: Any) {
        let status = KeyChain.remove(forKey: "MyKey")
        // if status == 0, success
        print(status)
    }
}

