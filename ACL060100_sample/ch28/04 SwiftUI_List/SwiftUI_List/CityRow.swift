//
//  CityRow.swift
//  SwiftUI_List
//
//  Created by 朱克剛 on 2020/9/12.
//  Copyright © 2020 朱克剛. All rights reserved.
//

import SwiftUI

struct CityRow: View {
    var city: City
    var body: some View {
        HStack {
            Image(city.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            Text(city.name)
            Spacer()
        }
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        CityRow(city: cityData[0])
            .previewLayout(.sizeThatFits)
    }
}
