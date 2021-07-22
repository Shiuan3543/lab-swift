//
//  ViewController.swift
//  UndoRedo
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func undoButton(_ sender: Any) {
        textField.undoManager?.undo()
    }
    
    @IBAction func redoButton(_ sender: Any) {
        textField.undoManager?.redo()
    }
    
}

