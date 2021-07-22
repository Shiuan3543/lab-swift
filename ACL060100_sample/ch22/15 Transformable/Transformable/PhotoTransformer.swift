//
//  PhotoTransformer.swift
//  Transformable
//
//  Created by KoKang Chu on 2019/7/19.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class PhotoTransformer: ValueTransformer {
    // 將自訂類別（型態）轉成 Data
    override func transformedValue(_ value: Any?) -> Any? {
        guard let value = value else {
            return nil
        }
        return try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false)
    }
    
    // 將 Data 還原為原本的類別（型態）
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(value as! Data)
    }

}
