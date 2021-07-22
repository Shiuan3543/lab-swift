//
//  ViewController.swift
//  TextView
//
//  Created by KoKang Chu on 2019/7/26.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "File", withExtension: "rtf")
        
        // RTF 非純文字，因此資料型態需為 NSAttributedString
        if let url = url, let text = try? NSAttributedString(
            url: url,
            options: [.documentType : NSAttributedString.DocumentType.rtf],
            documentAttributes: nil
            ) {
            // 非純文字使用 attributedText 屬性，純文字使用 text 屬性，
            textView.attributedText = text
            // 設定唯讀
            textView.isEditable = false
        }
    }


}

