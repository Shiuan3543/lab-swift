//
//  ViewController.swift
//  LabelTest
//
//  Created by imedi on 2021/5/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.numberOfLines = 2 //行數
        let t1 = UIFont.preferredFont(forTextStyle: .title1)
        // let labT1 = ... 
        /*let t2 = NSMutableAttributedString(string: Text0.text!)
        t2.addAttribute(.strikethroughStyle, value: 0, range: NSMakeRange(0, t2.length))*/
        let tE = UIFont.preferredFont(forTextStyle: .footnote)
        let t = NSMutableAttributedString(
            string: "peko peko peko\n",attributes: [
                .font : tE,
                .foregroundColor:UIColor.blue
            ])
        t.append(NSMutableAttributedString(
                string: "Yubi Yubi", attributes: [
                    .font: t1,
                    .foregroundColor:UIColor.red
                ])
        
        )
        textLabel.attributedText = t
    }
}

