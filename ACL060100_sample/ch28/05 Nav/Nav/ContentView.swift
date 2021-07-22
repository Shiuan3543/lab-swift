//
//  ContentView.swift
//  Nav
//
//  Created by 朱克剛 on 2020/9/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(cityData) {city in
                NavigationLink(
                    destination: CityDetail(city: city)) {
                    CityRow(city: city)
                }
            }.navigationTitle("六都")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
