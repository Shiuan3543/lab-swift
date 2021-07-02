//
//  ViewController.swift
//  StepperTest
//
//  Created by imedi on 2021/5/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var I_dont_know_Image: UIImageView!
    @IBOutlet weak var showpageLabel: UILabel!
    var page : Int = 0
    var pagenumber : Int = 0
    @IBAction func Steppertest(_ sender: UIStepper) {
        
        pagenumber = Int(sender.value)
        page = Int(sender.value)%5
        //取得索引 最左為0
        //根據索引取得文章標題
        //print(sender.titleForSegment(at: index)!)
//        if index == 0 { //判斷使用者選擇是哪一個Segmented
//            I_dont_know.image = UIImage(named: "Mumi") //顯示Mumi圖片
//        }else if index == 1{
//            I_dont_know.image = UIImage(named: "Karyl") //顯示Karyl圖片
//        }else if index == 2{
//            I_dont_know.image = UIImage(named: "Peko") //顯示Peko圖片
//        }else if index == 3{
//            I_dont_know.image = UIImage(named: "Watame") //顯示Watame圖片
//        }else{
//            I_dont_know.image = UIImage(named: "Eren") //顯示Eren圖片
//        }
        switch page {
        case 0:
            showlabel()
            I_dont_know_Image.image = UIImage(named: "Mumi") //顯示Mumi圖片
        case 1:
            showlabel()
            I_dont_know_Image.image = UIImage(named: "Karyl") //顯示Karyl圖片
        case 2:
            showlabel()
            I_dont_know_Image.image = UIImage(named: "Peko") //顯示Peko圖片
        case 3:
            showlabel()
            I_dont_know_Image.image = UIImage(named: "Watame") //顯示Watame圖片
        default:
            showlabel()
            I_dont_know_Image.image = UIImage(named: "Eren") //顯示Eren圖片
        }
    }
    func showlabel() {
        I_dont_know_Image.image = UIImage(named: "Mumi") //顯示Mumi圖片
        showpageLabel.numberOfLines = 2
        let labT1 = UIFont.preferredFont(forTextStyle: .title1)
        let labT2 = UIFont.preferredFont(forTextStyle: .title2)
        let labT = NSMutableAttributedString(
            string: "Page\n",attributes: [
                .font : labT1,
                .foregroundColor:UIColor.black
            ])
        labT.append(NSMutableAttributedString(
                string: String(pagenumber+1), attributes: [
                    .font: labT2,
                    .foregroundColor:UIColor.red
                ])
        )
        showpageLabel.attributedText = labT
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showlabel()
    }
}

