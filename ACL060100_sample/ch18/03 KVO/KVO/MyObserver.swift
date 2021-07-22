//
//  MyObserver.swift
//  KVO
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class MyObserver: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if let object = object as? NSObject {
//            let n = object.value(forKeyPath: keyPath!)
//            print(n!)
//        }
//
//        if keyPath == "n", let old = change?[.oldKey] {
//            print("舊的值: \(old)")
//        }
        
        if keyPath == "n" {
            if let old = change?[.oldKey], let new = change?[.newKey] {
                print("舊的值: \(old)")
                print("新的值: \(new)")
            }
        }

    }
}
