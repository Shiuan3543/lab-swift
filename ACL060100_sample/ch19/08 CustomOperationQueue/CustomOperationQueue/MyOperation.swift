//
//  MyOperation.swift
//  CustomOperationQueue
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class MyOperation: Operation {
    private var range: ClosedRange<Int>
    
    init(_ range: ClosedRange<Int>) {
        self.range = range
    }
    
    override func main() {
        Array(range).forEach { (i) in
            print(i)
            Thread.sleep(forTimeInterval: TimeInterval.random(in: 0.0...0.5))
        }
    }
}
