//
//  CityDetail.swift
//  Nav
//
//  Created by 朱克剛 on 2020/9/12.
//

import SwiftUI

struct CityDetail: View {
    var city: City
    var body: some View {
        VStack {
            MapView(coordinate: city.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            Image(city.imageName)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -130)
                .padding(.bottom, -100)
            
            Text(city.name)
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}

struct CityDetail_Previews: PreviewProvider {
    static var previews: some View {
        CityDetail(city: cityData[3])
    }
}
