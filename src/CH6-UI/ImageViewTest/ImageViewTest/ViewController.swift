//
//  ViewController.swift
//  SegmentedControlTest
//
//  Created by imedi on 2021/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    var ImageBool :Bool = false
    var Ani:Bool = false
    var Runbutton :Bool = false
    @IBOutlet weak var ChangePeko: UIButton!
    @IBOutlet weak var Imageviewtest: UIImageView!
    @IBAction func SAT(_ sender: UISegmentedControl) {
        //取得索引 最左為0
        let index = sender.selectedSegmentIndex
        //根據索引取得文章標題
        //print(sender.titleForSegment(at: index)!)
//        if index == 0 { //判斷使用者選擇是哪一個Segmented
//            Imageviewtest.contentMode = .scaleToFill//
//        }else if index == 1{
//            Imageviewtest.contentMode = .scaleAspectFit
//        }else if index == 2{
//            Imageviewtest.contentMode = .scaleAspectFill
//        }else if index == 3{
//            Imageviewtest.contentMode = .redraw
//        }else if index == 4{
//            Imageviewtest.contentMode = .center
//        }else if index == 5{
//            Imageviewtest.contentMode = .top
//        }else if index == 6{
//            Imageviewtest.contentMode = .bottom
//        }else if index == 7{
//            Imageviewtest.contentMode = .left
//        }else if index == 8{
//            Imageviewtest.contentMode = .right
//        }else if index == 9{
//            Imageviewtest.contentMode = .topLeft
//        }else if index == 10{
//            Imageviewtest.contentMode = .topRight
//        }else if index == 11{
//            Imageviewtest.contentMode = .bottomLeft
//        }else {
//            Imageviewtest.contentMode = .bottomRight
//        }
        
        switch index {
        case 1:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .scaleAspectFit
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 2:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .scaleAspectFill
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 3:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .redraw
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 4:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .center
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 5:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .top
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 6:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .bottom
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 7:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .left
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 8:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .right
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 9:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .topLeft
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 10:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .topRight
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 11:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .bottomLeft
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 12:
            Ani = false
            SetPeko()
            Imageviewtest.contentMode = .bottomRight
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        case 13:
            Ani = true
            Imageviewtest.clipsToBounds = true
            Imageviewtest.contentMode = .scaleAspectFit
            Imageviewtest.image = UIImage(named: "01")
            var Houremove = [UIImage]()//載入所有要放的圖片
            for i in 1...5 {
                let name = String(format: "%02d", i)
                Houremove.append(UIImage(named: name)!)
            }
            Imageviewtest.animationImages = Houremove
            Imageviewtest.animationDuration = 0.3//0.3秒播完
            Imageviewtest.animationRepeatCount = 10//重複10次
            
            ChangePeko.backgroundColor = UIColor.blue//按鈕背景顏色藍
            ChangePeko.setTitle("Ready", for: .normal)
            ChangePeko.setTitleColor(UIColor.red, for: .normal)
            ChangePeko.setTitle("Run", for: .highlighted)
            ChangePeko.setTitleColor(UIColor.orange, for: .highlighted)
        default:
            Imageviewtest.contentMode = .scaleToFill
            //Imageviewtest.clipsToBounds = true
            //Imageviewtest.image = UIImage(named: "PainPeko") //
        }
    }
    @IBAction func ChangePekoButton(_ sender: UIButton) {
        if Ani == true{
            Runbutton = !Runbutton
            if Runbutton == false {
                Imageviewtest.clipsToBounds = true//
                ChangePeko.backgroundColor = UIColor.blue//按鈕背景顏色藍
                Imageviewtest.stopAnimating()
                ChangePeko.setTitle("Ready", for: .normal)
                ChangePeko.setTitleColor(UIColor.red, for: .normal)
            } else {
                ChangePeko.backgroundColor = UIColor.systemPink//按鈕背景顏色粉
                Imageviewtest.startAnimating()
                Imageviewtest.image = UIImage(named: "01")
                ChangePeko.setTitle("Stop", for: .normal)
                ChangePeko.setTitleColor(UIColor.black, for: .normal)
            }
        } else {
            ImageBool = !ImageBool;
            SetPeko()
        }
    }
    func SetPeko(){
        if ImageBool == false {
            ChangePeko.backgroundColor = UIColor.blue//按鈕背景顏色藍
            ChangePeko.setTitle("PainPeko", for: .normal)
            ChangePeko.setTitleColor(UIColor.white, for: .normal)
            ChangePeko.setTitle("Ha↗️Ha↘️Ha↗️Ha↘️Ha↗️Ha↘️Ha↗️", for: .highlighted)
            ChangePeko.setTitleColor(UIColor.orange, for: .highlighted)
            Imageviewtest.image = UIImage(named: "PainPeko") //
        } else {
            ChangePeko.backgroundColor = UIColor.systemPink//按鈕背景顏色粉
            ChangePeko.setTitle("Too oil", for: .normal)
            ChangePeko.setTitleColor(UIColor.yellow, for: .normal)
            ChangePeko.setTitle("Ha↗️Ha↘️Ha↗️Ha↘️Ha↗️Ha↘️Ha↗️", for: .highlighted)
            ChangePeko.setTitleColor(UIColor.orange, for: .highlighted)
            Imageviewtest.image = UIImage(named: "Toooil") //
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ChangePeko.isEnabled = true //設定初始狀態可用
        ChangePeko.isSelected = false//設定初始狀態非選擇
        ChangePeko.setTitle("Ha↗️Ha↘️Ha↗️Ha↘️Ha↗️Ha↘️Ha↗️", for: .highlighted)
        ChangePeko.setTitleColor(UIColor.orange, for: .highlighted)
//        Imageviewtest.clipsToBounds = true//
//        if ChangePeko.isHighlighted == true  {
//            ChangePeko.backgroundColor = UIColor.purple//按鈕背景顏色粉紅
//        }??????
        ChangePeko.backgroundColor = UIColor.blue//按鈕背景顏色藍
        ChangePeko.setTitle("PainPeko", for: .normal)
        ChangePeko.setTitleColor(UIColor.white, for: .normal)
        Imageviewtest.image = UIImage(named: "PainPeko") //
        }
}
