//
//  MyObj.swift
//  CustomObject
//
//  Created by KoKang Chu on 2019/7/11.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class MyObj: NSObject, NSCoding {
    var image: UIImage
    var text: String?
    
    init(image: UIImage, text: String?) {
        self.image = image
        self.text = text
    }
    
    // 編碼
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "text")
        aCoder.encode(image.pngData(), forKey: "image")
    }
    
    // 解碼
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "text") as? String
        let data = aDecoder.decodeObject(forKey: "image") as! Data
        image = UIImage(data: data)!
    }

}
