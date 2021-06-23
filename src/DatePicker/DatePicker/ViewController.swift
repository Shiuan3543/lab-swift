//
//  ViewController.swift
//  DatePicker
//
//  Created by imediplus_mac2 on 2021/6/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datetimeLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var countdownDatepicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datetimeLabel.numberOfLines = 1
        let datetimeTitle = UIFont.preferredFont(forTextStyle: .largeTitle)
        let datetimeStyle = NSMutableAttributedString(string: "Time",attributes: [.font: datetimeTitle,.foregroundColor:UIColor.brown])
        datetimeLabel.attributedText = datetimeStyle
        countdownLabel.numberOfLines = 1
        let countdownTitle = UIFont.preferredFont(forTextStyle: .largeTitle)
        let countdownStyle = NSMutableAttributedString(string: "Countdown",attributes: [.font: countdownTitle,.foregroundColor:UIColor.systemBlue])
        countdownLabel.attributedText = countdownStyle
    }
    
    @IBAction func DatePickerTest(_ sender: UIDatePicker) {
        let testFormatter = DateFormatter()
        testFormatter.dateFormat = "yyyy/M/d H:m"
        let dateString = testFormatter.string(from: sender.date)
        print(dateString)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var second = countdownDatepicker.countDownDuration
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ (timer) in
            guard second >= 0 else {
                timer.invalidate()
                return
            }
            //countdownLabel.text = String(second)
            //countdownLabel.attributedText = NSMutableAttributedString(string: "Countdown",attributes: [.font: countdownTitle,.foregroundColor:UIColor.systemBlue])
            print("\(second)s")
            second -= 1
        }
    }
}

