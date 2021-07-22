//
//  ViewController.swift
//  ImageFilter
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let origin = CIImage(image: UIImage(named: "a.jpg")!)
        
        // 將圖片套用單色濾鏡
        let filter = CIFilter(name: "CIPhotoEffectMono")
        filter?.setDefaults()
        filter?.setValue(origin, forKey: kCIInputImageKey)

        // 取得套用濾鏡後的效果
        if let output = filter?.outputImage {
            // 將照片轉為 UIImage 格式
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            // 顯示套用濾鏡後的結果
            imageView.image = UIImage(cgImage: tmp!)
        }
    }


}

