//
//  Data.swift
//  SwiftUI_List
//
//  Created by 朱克剛 on 2020/9/12.
//  Copyright © 2020 朱克剛. All rights reserved.
//

import SwiftUI

struct City: Identifiable {
    let id = UUID()
    var name: String
    var imageName: String {
        return name
    }
}

let cityData = [
    City(name: "台北"),
    City(name: "新北"),
    City(name: "桃園"),
    City(name: "台中"),
    City(name: "台南"),
    City(name: "高雄"),
]
