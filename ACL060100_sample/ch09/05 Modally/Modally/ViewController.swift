//
//  ViewController.swift
//  Modally
//
//  Created by KoKang Chu on 2019/7/17.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAdaptivePresentationControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination.presentationController
        vc?.delegate = self
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) ->
        UIModalPresentationStyle {
            return .none
    }
}

