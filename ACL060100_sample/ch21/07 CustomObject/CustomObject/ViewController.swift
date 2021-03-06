//
//  ViewController.swift
//  CustomObject
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "a.jpg")
        
        // 初始化 MyObj
        let myObj = MyObj(image: image!, text: "此圖片說明")
        // 存檔路徑，檔名為 save.dat
        let url = URL(fileURLWithPath: NSHomeDirectory() + "/Documents/save.data")
        
        // 存檔
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: myObj, requiringSecureCoding: false)
            try data.write(to: url)
        } catch {
            print("存檔失敗")
        }
        
        // 讀檔
        do {
            let data = try Data(contentsOf: url)
            let obj = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! MyObj
            imageView.image = obj.image
            label.text = obj.text
        } catch {
            print("讀檔失敗")
        }

    }


}

