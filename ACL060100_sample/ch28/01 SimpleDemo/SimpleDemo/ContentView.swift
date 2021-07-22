//
//  ContentView.swift
//  SimpleDemo
//
//  Created by 朱克剛 on 2020/9/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .foregroundColor(.blue)
            .rotationEffect(.degrees(15))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
