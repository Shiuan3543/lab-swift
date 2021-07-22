//
//  ContentView.swift
//  SimpleList
//
//  Created by 朱克剛 on 2020/9/12.
//

import SwiftUI

struct ContentView: View {
    let zoo = ["台北", "新北", "桃園", "台中", "台南", "高雄"]
    
    var body: some View {
        List(0..<zoo.count) {
            Text(self.zoo[$0])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
