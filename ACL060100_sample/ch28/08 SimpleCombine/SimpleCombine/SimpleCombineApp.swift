//
//  SimpleCombineApp.swift
//  SimpleCombine
//
//  Created by 朱克剛 on 2020/9/15.
//

import SwiftUI

@main
struct SimpleCombineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserData())
        }
    }
}
