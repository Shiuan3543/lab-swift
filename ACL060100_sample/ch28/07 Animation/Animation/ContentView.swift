//
//  ContentView.swift
//  Animation
//
//  Created by 朱克剛 on 2020/9/12.
//

import SwiftUI

struct ContentView: View {
    @State var flag: Bool = false
    
    var body: some View {
        VStack {
            Button("按我") {
                flag.toggle()
            }.padding()
            
            Image(systemName: "paperclip")
                .imageScale(.large)
                .rotationEffect(.degrees(flag ? 90 : 0))
                .animation(.easeInOut)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
