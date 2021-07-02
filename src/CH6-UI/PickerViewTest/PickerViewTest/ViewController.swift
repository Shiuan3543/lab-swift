//
//  ViewController.swift
//  PickerViewTest
//
//  Created by imedi on 2021/6/3.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    var horsesName :String = ""
    var horsesTitle :String = ""
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2 //2個滾輪
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return namesArray.count
        } else if component == 1 {
            return titlesArray.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
        if component == 0 {
            nameLabel.text = namesArray[row]
            return namesArray[row]
        } else if component == 1 {
            raceLabel.text = titlesArray[row]
            return titlesArray[row]
        }
        return nil
    }
    
//    private func pickerView(_ pickerView: UIPickerView, didSelectRow row:Int, inComponent component: Int) -> Int? {
//        if component == 0 {
//            //print("名稱：\(Name[row])")
//            HorseName = Name[row]
//            name.text = "" + HorseName
//        } else if component == 1 {
//            //print("稱號：\(Title[row])")
//            HorseTitle = Title[row]
//            race.text = "" + HorseTitle
//        }
//        return nil
//    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0 {
                horsesName = namesArray[row]
                nameLabel.text = horsesName
            } else if component == 1 {
                horsesTitle = titlesArray[row]
                raceLabel.text = horsesTitle
            }
        }

    
    let namesArray = ["スペシャルウィーク","サイレンススズカ","メジロマックイーン","トウカイテイオー","ダイワスカーレット","ウオッカ","ゴールドシップ","ライスシャワー","ハルウララ"]
    let titlesArray = ["日本の総大将","異次元の逃亡者","名優","帝王","ミスパーフェクト","常識破りの女帝","破天荒","黑い刺客","ハルウララがんばる"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.numberOfLines = 1 //行數
        raceLabel.numberOfLines = 1
        let fronttitle = UIFont.preferredFont(forTextStyle: .largeTitle)
        //let fronttext = UIFont.preferredFont(forTextStyle: .largeTitle)
        let namestyle = NSMutableAttributedString(
            string: "名前:\n",attributes: [
                .font : fronttitle,
                .foregroundColor:UIColor.blue
            ]
        )
        /*namestyle.append(NSMutableAttributedString(
                            string: horsesName, attributes: [
                                .font: fronttext,
                                .foregroundColor:UIColor.gray
                            ])
        )*/
        let titlestyle = NSMutableAttributedString(
            string: "称号:\n",attributes: [
                .font : fronttitle,
                .foregroundColor:UIColor.brown
            ]
        )
        /*titlestyle.append(NSMutableAttributedString(
                            string: horsesTitle, attributes: [
                                .font: fronttext,
                                .foregroundColor:UIColor.brown
                            ])
        )*/
        nameLabel.attributedText = namestyle
        raceLabel.attributedText = titlestyle
    }
}
