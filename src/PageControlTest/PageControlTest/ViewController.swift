//
//  ViewController.swift
//  PageControlTest
//
//  Created by imedi on 2021/5/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var I_dont_know: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        I_dont_know.image = UIImage(named: "Mumi") //顯示Mumi圖片
    }
    @IBAction func PageContro(_ sender: UIPageControl) {
        //取得索引 最左為0
        let index = sender.currentPage
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
        switch index {
//        case 0:
//            I_dont_know.image = UIImage(named: "Mumi") //顯示Mumi圖片
        case 1:
            I_dont_know.image = UIImage(named: "Karyl") //顯示Karyl圖片
        case 2:
            I_dont_know.image = UIImage(named: "Peko") //顯示Peko圖片
        case 3:
            I_dont_know.image = UIImage(named: "Watame") //顯示Watame圖片
        case 4:
            I_dont_know.image = UIImage(named: "Eren") //顯示Eren圖片
        default:
            I_dont_know.image = UIImage(named: "Mumi") //顯示Mumi圖片
        }
    }
}

