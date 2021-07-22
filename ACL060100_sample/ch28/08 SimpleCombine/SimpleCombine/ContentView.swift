//
//  ContentView.swift
//  SimpleCombine
//
//  Created by 朱克剛 on 2020/9/15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        let button = Button(action: {
            userData.n += 1
        }) {
            Text("按我就加1").font(.title2)
        }.disabled(userData.n >= 5)

        VStack {
            button
            Text("value is \(Int(userData.n))")
                .font(.largeTitle)
            
            ResetView().frame(width: 150)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
