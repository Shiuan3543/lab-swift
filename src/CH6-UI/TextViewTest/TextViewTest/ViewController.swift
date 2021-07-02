//
//  ViewController.swift
//  TextViewTest
//
//  Created by imedi on 2021/6/1.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urltest = Bundle.main.url(forResource: "RichTestFileTest", withExtension: "rtf")
        //RTF非純文字，資料型態需為NSAttributedString
        if let url = urltest,let texttest = try? NSAttributedString(
            url:url,
            options: [.documentType:NSAttributedString.DocumentType.rtf],documentAttributes: nil
        ){
            textview.attributedText = texttest
            textview.isEditable = false
        }
    }
}
