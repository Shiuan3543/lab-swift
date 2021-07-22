//
//  ViewController.swift
//  Delegate
//
//  Created by KoKang Chu on 2019/7/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyObjectDelegate {

    let myObj = MyObject()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myObj.delegate = self
        myObj.divide(6, by: 2)
        myObj.divide(5, by: 0)
    }

    func returnAnswer(object: MyObject, answer: Float) {
        print(answer)
    }
    
    func returnError(error: NSError?) {
        if error != nil {
            print(error!.localizedDescription)
        }
    }

}

