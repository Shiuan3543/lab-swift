//
//  ResetView.swift
//  SimpleCombine
//
//  Created by 朱克剛 on 2020/9/15.
//

import SwiftUI

struct ResetView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        Slider(value: $userData.n, in: 0...5)
    }
}

struct ResetView_Previews: PreviewProvider {
    static var previews: some View {
        ResetView().environmentObject(UserData())
    }
}
