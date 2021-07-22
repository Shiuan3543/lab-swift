//
//  ContentView.swift
//  Toggle
//
//  Created by 朱克剛 on 2020/9/12.
//

import SwiftUI

struct ContentView: View {
    @State var isToggleOn: Bool = false
    @State var counter: Int = 0

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button(action: {
                    counter += 1
                }) {
                    Text("計數器")
                }.disabled(!isToggleOn)
                .padding(.leading, 20)
                
                Spacer()
                
                Toggle("", isOn: $isToggleOn)
                    .labelsHidden()
                    .padding(.trailing, 20)
            }

            Form {
                if isToggleOn {
                    Text("\(counter)").foregroundColor(.blue)
                } else {
                    Text("\(counter)").foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
