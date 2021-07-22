//
//  ContentView.swift
//  SwiftUI_List
//
//  Created by 朱克剛 on 2020/9/12.
//  Copyright © 2020 朱克剛. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        List(cityData) {city in
            CityRow(city: city)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
