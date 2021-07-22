//
//  ViewController.swift
//  Label
//
//  Created by KoKang Chu on 2019/7/25.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 設定 label 可以顯示兩行文字
        label.numberOfLines = 2
        
        let title1 = UIFont.preferredFont(forTextStyle: .title1)
        let footnote = UIFont.preferredFont(forTextStyle: .footnote)
        
        // 讓 hello 套用 title1 字型樣式
        let style = NSMutableAttributedString(
            string: "Hello\n",
            attributes: [.font : title1]
        )
        
        style.append(NSMutableAttributedString(
            string: "第二行文字", attributes: [
                .font: footnote,
                .foregroundColor: UIColor.blue
            ])
        )
        
        // 顯示到 label 上
        label.attributedText = style
    }


}

